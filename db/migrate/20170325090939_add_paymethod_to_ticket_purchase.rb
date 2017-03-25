class AddPaymethodToTicketPurchase < ActiveRecord::Migration
  def change
    add_column :ticket_purchases, :paymethod, :string
  end
end
