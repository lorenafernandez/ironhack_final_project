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
		#Local.where("shows=? OR type_of_professional=?",current_user.artist.you_are,current_user.artist.type_of_professional)
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
end