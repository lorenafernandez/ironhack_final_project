class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.references :user
      t.string :you_are
      t.string :type_of_professional
      t.string :type_of_locals
      t.string :agreements_with_locals
      t.string :type_of_expositions
      t.timestamps
    end
    add_foreign_key :artists, :users
  end

end

