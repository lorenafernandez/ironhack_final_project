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
	
	end
end