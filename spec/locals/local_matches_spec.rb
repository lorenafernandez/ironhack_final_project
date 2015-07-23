require "rails_helper"

RSpec.describe Local, :type => :model do
   
   it "returns 3 matches: Artes Visuales, Consagrados, Alquiler del local" do
    user = User.find 48rfgtgfbfgtr
    local = Local.find 23
    expect(user.local.my_artists.first.stars).to eq(3)
  end

end





