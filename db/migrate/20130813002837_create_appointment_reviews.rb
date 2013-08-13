class CreateAppointmentReviews < ActiveRecord::Migration
  def change
    create_table :appointment_reviews do |t|
      t.belongs_to :appointment
      t.belongs_to :user
      t.integer :rating
      t.text :summary
      t.timestamps
    end
  end
end
