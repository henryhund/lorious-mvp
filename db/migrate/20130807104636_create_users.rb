class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :email
    	t.string :name
    	t.string :stripe_customer_id
    	t.boolean :active, default: true
      t.timestamps
    end
  end
end
