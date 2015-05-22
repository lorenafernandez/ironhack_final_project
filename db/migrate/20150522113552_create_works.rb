class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :artist
      t.string :title
      t.string :size
      t.string :price
	    t.attachment :avatar
      t.timestamps null: false
    end
    add_foreign_key :works, :artists
  end
end
