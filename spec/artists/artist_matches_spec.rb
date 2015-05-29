require "rails_helper"

RSpec.describe Artist, :type => :model do

  it "find users correctly in test db" do 
    user = User.find 25
    expect(user.name).to eq("Pepe")
  end


  it "returns 3 matches: Artes Visuales, Consagrados, Alquiler del local" do
    user = User.find 25
    artist = Artist.find 25
    expect(user.artist.my_locals.first.stars).to eq(3)
  end
  
end