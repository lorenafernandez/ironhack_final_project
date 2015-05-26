require "rails_helper"

RSpec.describe Local, :type => :model do

  it "returns [] after filter local when there are no matches in BD" do

  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	photographer = user_juan.create_artist!(you_are: "Fotografía")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    sculptor = user_pepe.create_artist!(you_are: "Escultura")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    local = user_manuela.create_local!(you_are: "Galería")

    expect(local.filter_for_artists("Pintura", "Madrid")).to eq([])

  end


  it "returns 1 after filter local when there are 1 match in BD" do

  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	photographer = user_juan.create_artist!(you_are: "Fotografía")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    sculptor = user_pepe.create_artist!(you_are: "Escultura")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    local = user_manuela.create_local!(you_are: "Galería")

    expect(local.filter_for_artists("Fotografía", "Madrid").first).to eq(photographer)

  end


  it "returns 1 after filter local when there are 1 match in BD" do

  	user_juan = User.create!(email: "juan@juan.com", password: "abcd1234", 
  							name: "Juan", address: "Calle Estambul 7, Madrid")
  	photographer_juan = user_juan.create_artist!(you_are: "Fotografía")

  	user_pepe = User.create!(email: "pepe@pepe.com", password: "abcd1234", 
  							name: "Pepe", address: "Calle Estambul 7, Madrid") 
    photographer_pepe = user_pepe.create_artist!(you_are: "Fotografía")

    user_manuela = User.create!(email: "manuela@malasaña.com", password: "abcd1234", 
  							name: "manuela")
    local = user_manuela.create_local!(you_are: "Galería")

    expect(local.filter_for_artists("Fotografía", "Madrid")).to eq([photographer_juan,photographer_pepe])

  end



end