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

end
