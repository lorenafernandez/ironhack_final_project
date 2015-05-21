class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.references :user
      t.string :you_are
      t.string :type_of_professional
      t.timestamps
    end
    add_foreign_key :artists, :users
  end

end

