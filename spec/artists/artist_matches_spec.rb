require "rails_helper"

RSpec.describe Artist, :type => :model do
  it "returns [] after ckeck in BD and there is no matches" do
  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	coffee = user_juan.create_local!(you_are: "Café Temático")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    museum = user_pepe.create_local!(you_are: "Museo")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    artist = user_manuela.create_artist!(you_are: "Fotografía")

    #expect(artist.filter_for_locals("Galería", "Madrid")).to eq([])

  end
end