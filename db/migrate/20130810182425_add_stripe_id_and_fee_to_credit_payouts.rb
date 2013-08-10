class AddStripeIdAndFeeToCreditPayouts < ActiveRecord::Migration
  def change
    add_column :credit_payouts, :stripe_id, :string
    add_column :credit_payouts, :stripe_fee, :integer
  end
end
