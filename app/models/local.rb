class Local < ActiveRecord::Base
	belongs_to :user
	delegate :name, to: :user
	attr_accessor :stars


	TYPE_OF_LOCALS = [["Galería", "Galería"], ["Museo", "Museo"], ["Café Temático", "Café Temático"],
					  ["Centro Cultural / Fundación ", "Centro Cultural / Fundación "],
					  ["Centro Educativo", "Centro Educativo"],["Otros", "Otros  "]]

	TYPE_OF_ARTISTS = [["Fotografía","Fotografía"],["Pintura ","Pintura "],["Escultura ","Escultura "],
					   ["Arquitectura","Arquitectura"], ["Artes Visuales","Artes Visuales"]]

	TYPE_OF_PROFESSIONALS = [["Consagrados","Consagrados"], ["Noveles","Noveles"], ["Amateurs","Amateurs"]]

	TYPE_OF_EXPOSITIONS =[["Un único artista", "Un único artista"],["Varios artistas", "Varios artistas"]]

	TYPE_OF_AGREEMENTS = [["Alquiler del local","Alquiler del local"],["Comisión de venta" , "Comisión de venta"]]

  

    def to_param
    	"#{id}-#{name.to_s.parameterize}"
    end


	def calculate_stars_for_artist(artist)
	    @stars = 0
	    @stars += 1 if shows == artist.you_are
	    @stars += 1 if you_are == artist.type_of_locals
	    @stars += 1 if type_of_professional == artist.type_of_professional
	    @stars += 1 if agreements == artist.agreements_with_locals
	    @stars += 1 if type_of_exposition == artist.type_of_expositions
	    self
	end


	def my_artists
		Rails.cache.fetch("artist::#{self.id}::my_locals", :expires_in => 1.day) do
		    artists = Artist.all.map do |artist|
		      artist.calculate_stars_for_local(self)
		    end
		    artists.sort_by { |a| a.stars }.reverse
		end
	end

	
	def filter_for_artists(show, province)
		Artist.joins(:user).where("artists.you_are = :show and users.address like :address", 
						show: show, address: '%' + province + '%')
	end

end


