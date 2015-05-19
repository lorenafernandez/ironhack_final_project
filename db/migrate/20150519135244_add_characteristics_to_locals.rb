class AddCharacteristicsToLocals < ActiveRecord::Migration
  def change
  	add_column :locals, :you_are, :string
  	add_column :locals, :shows, :string
  	add_column :locals, :type_of_professional, :string
  	add_column :locals, :type_of_exposition, :string
  	add_column :locals, :agreements, :string
  	add_column :locals, :user_id, :integer
  end
end
