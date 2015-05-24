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
end
