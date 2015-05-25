class Local < ActiveRecord::Base
	belongs_to :user

	TYPE_OF_LOCALS = [["Galería", "Galería"], ["Museo", "Museo"], ["Café Temático", "Café Temático"],
					  ["Centro Cultural / Fundación ", "Centro Cultural / Fundación "],
					  ["Centro Educativo", "Centro Educativo"],["Otros", "Otros  "]]

	TYPE_OF_ARTISTS = [["Fotografía","Fotografía"],["Pintura ","Pintura "],["Escultura ","Escultura "],
					   ["Arquitectura","Arquitectura"], ["Artes Visuales","Artes Visuales"]]

	TYPE_OF_PROFESSIONALS = [["Consagrados","Consagrados"], ["Noveles","Noveles"], ["Amateurs","Amateurs"]]

	TYPE_OF_EXPOSITIONS =[["Un único artista", "Un único artista"],["Varios artistas", "Varios artistas"]]

	TYPE_OF_AGREEMENTS = [["Alquiler del local","Alquiler del local"],["Comisión de venta" , "Comisión de venta"]]

   delegate :name, to: :user

    def to_param
    	"#{id}-#{name.parameterize}"
    end	

	def my_artists
		matches = Hash.new
		matches.default = 0
		find_match_type_of_artist(matches)	
	end

	def find_match_type_of_artist(matches)
		match_type_of_artist = Artist.where("you_are=?", user.local.shows)
		match_type_of_artist.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_local(matches)
	end

	def find_match_type_of_local(matches)
		match_type_of_local = Artist.where("type_of_locals=?", user.local.you_are)
		match_type_of_local.each do |match|
			matches[match.id] += 1  
		end
		find_match_type_of_professional(matches)
	end

	def find_match_type_of_professional(matches)
		match_type_of_professional = Artist.where("type_of_professional=?", user.local.type_of_professional)
		match_type_of_professional.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_agreements(matches)
	end

	def find_match_type_of_agreements(matches)
		match_type_of_agreements = Artist.where("agreements_with_locals=?", user.local.agreements)
		match_type_of_agreements.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_expositions(matches)
	end

	def find_match_type_of_expositions(matches)
		match_type_of_expositions = Artist.where("type_of_expositions=?", user.local.type_of_exposition)
		match_type_of_expositions.each do |match|
			matches[match.id] += 1 
	    end
	    sorted_artists(matches)
	end

	def sorted_artists(matches)
		matches = Hash[matches.sort_by{|k, v| v}.reverse]
	end


	##### FILTERS #####
	def filter_for_artists(show, province)
		matches = Hash.new
		matches.default = 0
		find_match_artists(matches, show, province)	
	end

	def find_match_artists(matches, show, province)
		match_type_of_local = Artist.where("you_are=?", show)
		match_type_of_local.each do |match|
			matches[match.id] += 1  
		end
		get_province_from_address(matches, province)
	end

	def get_province_from_address(matches,province)
		provinces = []
		ids = []
		matches.keys.each do |match|
			 artist = Artist.find match
			 address = artist.user.address.split(", España")
			 provinces.push(address.first.split().last)
			 ids.push(artist.id)
		end

		get_matches_provinces(provinces,ids,province,matches)
	end

	def get_matches_provinces(provinces,ids,province,matches)
		i = 0
		provinces.each do |a|
			matches[ids[i]]+=1 if province == a
			i+=1
		end
		results_for_artist_filters(matches)
	end

	def results_for_artist_filters(matches)
		values = matches.values
		keys = matches.keys
		final_ids = []
		i = 0
		values.each do |value|
				
			if value == 2 
				final_ids.push(keys[i])
			end
			i+=1
		end
		return final_ids
	end

end
