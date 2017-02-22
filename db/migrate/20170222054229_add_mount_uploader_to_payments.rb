class AddMountUploaderToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :attachment, :string
  end
end
