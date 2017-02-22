class AddMountUploaderToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :mount_uploader, :attachment
  end
end
