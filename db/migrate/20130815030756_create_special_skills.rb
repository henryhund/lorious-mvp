class CreateSpecialSkills < ActiveRecord::Migration
  def change
    create_table :special_skills do |t|
      t.belongs_to :expert
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
