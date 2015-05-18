class AddCharacteristicsToArtists < ActiveRecord::Migration
  def change
  	add_column :artists, :you_are, :string
	add_column :artists, :type_of_professional, :string
  end
end
