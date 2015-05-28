class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :works
	attr_accessor :stars
	delegate :name, to: :user

	TYPE_OF_ARTISTS = [["Fotógrafo", "Fotografía"], ["Pintor", "Pintura"], ["Escultor", "Escultura"], 
						["Arquitecto","Arquitectura" ], ["Realizas videoarte", "Artes Visuales"]]

	TYPE_OF_PROFESSIONALS = [["Profesional consagrado", "Consagrados"],["Profesional novel", "Noveles"],["Amateur","Amateurs"]]

	TYPE_OF_LOCALS = [["Galerías", "Galería"], ["Museos", "Museo"], ["Cafés Temáticos", "Café Temático"],
					  ["Centros Culturales / Fundaciones", "Centro Cultural / Fundación"],
					  ["Centros Educativos", "Centro Educativo"], ["Otros", "Otros"]]

    TYPE_OF_AGREEMENTS = [["Sólo para alquiler","Alquiler del local"],["Con comisión de venta" , "Comisión de venta"]]

    TYPE_OF_EXPOSITIONS = [["Individuales", "Un único artista"],["En compañía de otros artistas", "Varios artistas"]]


    def to_param
    	"#{id}-#{name.to_s.parameterize}"	
    end	

    def calculate_stars_for_local(local)
	    @stars = 0
	    @stars += 1 if you_are == local.shows
	    @stars += 1 if type_of_locals == local.you_are
	    @stars += 1 if type_of_professional == local.type_of_professional
	    @stars += 1 if agreements_with_locals == local.agreements
	    @stars += 1 if type_of_expositions == local.type_of_exposition
	    self
  	end


  	def my_locals
  		Rails.cache.fetch("local::#{self.id}}::my_artists", :expires_in => 1.day) do
    		locals = Local.all.map do |local|
	      		local.calculate_stars_for_artist(self)
	    	end
	    locals.sort_by { |a| a.stars }.reverse
  		end
	end


	def filter_for_locals(show, province)
		Local.joins(:user).where("locals.you_are = :show and users.address like :address", 
					show: show, address: '%' + province + '%')
	end

end