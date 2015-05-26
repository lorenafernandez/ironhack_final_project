require "rails_helper"

RSpec.describe Local, :type => :model do

    let(:user_juan) {User.create!(user_params(email: "juan@juan.com"))}
    let(:user_pepe) {User.create!(user_params(email: "pepe@pepe.com"))}
    let(:user_paco) {User.create!(user_params(email: "paco@paco.com"))}
    let(:user_manuela) {User.create!(user_params(email: "manuela@malasaña.com"))}

    let(:photographer) {user_juan.create_artist!(you_are: "Fotografía")}
    let(:another_photographer) {user_paco.create_artist!(you_are: "Fotografía")}
    let(:sculptor) {user_pepe.create_artist!(you_are: "Escultura")}

    let(:local) {user_manuela.create_local!(you_are: "Galería")}

  it "returns [] after filter local when there are no matches in BD" do

    expect(local.filter_for_artists("Pintura", "Madrid")).to eq([])

  end


  it "returns 1 after filter local when there are 1 match in BD" do

    expect(local.filter_for_artists("Fotografía", "Madrid")).to eq([photographer])

  end


  it "returns 1 after filter local when there are 1 match in BD" do

    expect(local.filter_for_artists("Fotografía", "Madrid")).to eq([photographer,another_photographer])

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