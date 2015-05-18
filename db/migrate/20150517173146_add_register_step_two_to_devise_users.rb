class AddRegisterStepTwoToDeviseUsers < ActiveRecord::Migration
  def change
  	  add_column :users, :name, :string
	  add_column :users, :biography, :text
	  add_column :users, :contact_person, :string
	  add_column :users, :phone_number, :string
	  add_column :users, :address, :string
	  add_column :users, :province, :string
	  add_column :users, :town, :string
	  add_column :users, :postal_code, :string
	  add_column :users, :web, :string
	  add_attachment :users, :avatar
	  add_column :users, :twitter, :string
	  add_column :users, :facebook, :string
	  add_column :users, :instagram, :string
	  add_column :users, :pinterest, :string
	  add_column :users, :google_plus, :string
  end
end
