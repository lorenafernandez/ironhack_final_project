require "rails_helper"

RSpec.describe Artist, :type => :model do

  let(:user_juan) {User.create!(user_params(email: "juan@juan.com"))}
  let(:user_pepe) {User.create!(user_params(email: "pepe@pepe.com"))}
  let(:user_paco) {User.create!(user_params(email: "paco@paco.com"))}
  let(:user_lolo) {User.create!(user_params(email: "lolo@lolo.com"))}
  let(:user_manuela) {User.create!(user_params(email: "manuela@malasaña.com"))}

  let(:coffee) {user_juan.create_local!(you_are: "Café Temático")}
  let(:museum) {user_pepe.create_local!(you_are: "Museo")}
  let(:gallery) {user_paco.create_local!(you_are: "Galería")}
  let(:another_museum) {user_lolo.create_local!(you_are: "Museo")}

  let!(:artist) {user_manuela.create_artist!(you_are: "Fotografía")}

  it "returns [] after filter artist when there are no matches in BD" do
    expect(artist.filter_for_locals("Galería", "Sevilla")).to eq([])
  end

  it "returns 1 local after filter artist when there are 1 match in BD" do  
    expect(artist.filter_for_locals("Café Temático", "Madrid")).to eq([coffee])
  end

  it "returns an array of two locals after filter artist when there are 2 matches in BD" do
    expect(artist.filter_for_locals("Museo", "Madrid")).to eq([museum,another_museum])
  end

  private
  def user_params(args={})
    {
     email: "pepe@pepe.com",
     password: "abcd1234",
     name: 'Pepe', 
     address: "Calle Estambul 7, Madrid" 
     }.merge(args)
  end

end