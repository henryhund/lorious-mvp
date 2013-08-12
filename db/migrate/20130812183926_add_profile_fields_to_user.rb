class AddProfileFieldsToUser < ActiveRecord::Migration
  def up
    drop_table :profiles
    add_column :users, :display_name, :string
    add_column :users, :tagline, :string
    add_column :users, :bio, :text
    add_column :users, :hourly_rate, :integer
  end

  def down
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
