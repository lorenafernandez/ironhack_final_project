class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      	t.references :user
      	t.string :you_are
  		t.string :shows
  		t.string :type_of_professional
  		t.string :type_of_exposition
  		t.string :agreements
  		t.integer :user_id
      	t.timestamps
    end
    add_foreign_key :locals, :users
  end
end
