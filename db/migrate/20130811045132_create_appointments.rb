class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :requester_id
      t.integer :expert_id
      t.integer :length
      t.datetime :start_time
      t.string :state
      t.text :description
      t.integer :number_of_credits
      t.timestamps
    end

    add_index :appointments, :state
  end

end
