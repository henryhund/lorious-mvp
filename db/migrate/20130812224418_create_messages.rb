class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :appointment
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :conversation_id
      t.text :body
      t.boolean :viewed, default: false
      t.timestamps
    end
  end
end
