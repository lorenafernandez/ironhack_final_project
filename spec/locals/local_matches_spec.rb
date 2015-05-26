require "rails_helper"

RSpec.describe Local, :type => :model do
  it "returns [] after ckeck in BD and there is no matches" do
  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	photographer = user_juan.create_artist!(you_are: "Fotografía", type_of_professional: "Consagrados",
  											type_of_locals: "Museo", agreements_with_locals: "Comisión de venta",
  											type_of_expositions: "Un único artista")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    sculptor = user_pepe.create_artist!(you_are: "Escultura", type_of_professional: "Noveles",
    									type_of_locals: "Café Temático",agreements_with_locals: "Comisión de venta",
    									type_of_expositions: "Un único artista")

    user = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  						name: "manuela")
    local = user.create_local!(you_are: "Galería", shows: "Fotografía",
    						   type_of_professional: "Amateur", type_of_exposition: "Varios artistas",
    						   agreements: 'Alquiler del local')

    expect(local.my_artists).to eq([])
  end
end





