class AddFirstAndLastNameToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  end
end
