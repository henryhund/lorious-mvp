class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :requester_id
      t.integer :expert_id
      t.integer :length
      t.datetime :start_time
      t.string :state
      t.text :description
      t.timestamps
    end

    add_index :appointment_requests, :state
  end
end
