class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.belongs_to :user
    	t.string :firstname
    	t.string :lastname
    	t.string :display_name
    	t.string :tagline
    	t.text :bio
      t.timestamps
    end
  end
end
