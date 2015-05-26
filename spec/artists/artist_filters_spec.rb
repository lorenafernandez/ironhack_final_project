require "rails_helper"

RSpec.describe Artist, :type => :model do
  it "returns [] after filter artist when there are no matches in BD" do
  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	coffee = user_juan.create_local!(you_are: "Café Temático")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    museum = user_pepe.create_local!(you_are: "Museo")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    artist = user_manuela.create_artist!(you_are: "Fotografía")

    expect(artist.filter_for_locals("Galería", "Madrid")).to eq([])

  end


  it "returns 1 local after filter artist when there are 1 match in BD" do
  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	gallery = user_juan.create_local!(you_are: "Galería")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    museum = user_pepe.create_local!(you_are: "Museo")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    artist = user_manuela.create_artist!(you_are: "Fotografía")

    expect(artist.filter_for_locals("Galería", "Madrid").first).to eq(gallery)

  end


  it "returns an array of two locals after filter artist when there are 2 matches in BD" do
  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Oslo 27, Madrid") 
    museum_juan = user_juan.create_local!(you_are: "Museo")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    museum_pepe = user_pepe.create_local!(you_are: "Museo")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    artist = user_manuela.create_artist!(you_are: "Fotografía")

    expect(artist.filter_for_locals("Museo", "Madrid")).to eq([museum_juan,museum_pepe])

  end


end