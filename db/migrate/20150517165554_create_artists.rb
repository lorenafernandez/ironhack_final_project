class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :user_id
    
      
      t.timestamps
    end
  end
end
