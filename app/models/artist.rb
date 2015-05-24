class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :works

	TYPE_OF_ARTISTS = [["Fotógrafo", "Fotografía"], ["Pintor", "Pintura"], ["Escultor", "Escultura"], 
						["Arquitecto","Arquitectura" ], ["Realizas videoarte", "Artes Visuales"]]

	TYPE_OF_PROFESSIONALS = [["Profesional consagrado", "Consagrados"],["Profesional novel", "Noveles"],["Amateur","Amateurs"]]

	TYPE_OF_LOCALS = [["Galerías", "Galería"], ["Museos", "Museo"], ["Cafés Temáticos", "Café Temático"],
					  ["Centros Culturales / Fundaciones", "Centro Cultural / Fundación"],
					  ["Centros Educativos", "Centro Educativo"], ["Otros", "Otros"]]

    TYPE_OF_AGREEMENTS = [["Sólo para alquiler","Alquiler del local"],["Con comisión de venta" , "Comisión de venta"]]

    TYPE_OF_EXPOSITIONS = [["Individuales", "Un único artista"],["En compañía de otros artistas", "Varios artistas"]]


	def my_locals
		matches = Hash.new
		matches.default = 0
		find_match_type_of_artist(matches)	
	end

	def find_match_type_of_artist(matches)
		match_type_of_artist = Local.where("shows=?", user.artist.you_are)
		match_type_of_artist.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_local(matches)
	end

	def find_match_type_of_local(matches)
		match_type_of_local = Local.where("you_are=?", user.artist.type_of_locals)
		match_type_of_local.each do |match|
			matches[match.id] += 1  
		end
		find_match_type_of_professional(matches)
	end

	def find_match_type_of_professional(matches)
		match_type_of_professional = Local.where("type_of_professional=?", user.artist.type_of_professional)
		match_type_of_professional.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_agreements(matches)
	end

	def find_match_type_of_agreements(matches)
		match_type_of_agreements = Local.where("agreements=?", user.artist.agreements_with_locals)
		match_type_of_agreements.each do |match|
			matches[match.id] += 1 
		end
		find_match_type_of_expositions(matches)
	end

	def find_match_type_of_expositions(matches)
		match_type_of_expositions = Local.where("type_of_exposition=?", user.artist.type_of_expositions)
		match_type_of_expositions.each do |match|
			matches[match.id] += 1 
	    end
	    sorted_locals(matches)
	end

	def sorted_locals(matches)
		matches = Hash[matches.sort_by{|k, v| v}.reverse]
	end

	

	def filter_for_locals(show, province)
		matches = Hash.new
		matches.default = 0
		find_match_locals(matches, show, province)	
	end

	def find_match_locals(matches, show, province)
		match_type_of_local = Local.where("you_are=?", show)
		match_type_of_local.each do |match|
			matches[match.id] += 1  
		end
		get_province_from_address(matches, province)
	end

	def get_province_from_address(matches,province)
		provinces = []
		ids = []
		matches.keys.each do |match|
			 local = Local.find match
			 address = local.user.address.split(", España")
			 provinces.push(address.first.split().last)
			 ids.push(local.id)
		end

		get_matches_provinces(provinces,ids,province,matches)
	end
		
		def get_matches_provinces(provinces,ids,province,matches)
			i = 0

			provinces.each do |a|
				matches[ids[i]]+=1 if province == a
				i+=1
			end
			results_for_local_filters(matches)
		end

		def results_for_local_filters(matches)
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