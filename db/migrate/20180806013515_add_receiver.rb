class AddReceiver < ActiveRecord::Migration[5.1]
  def change
  	remove_column :receivers, :app_name
  	add_column :receivers, :company_name, :string
  	add_column :receivers, :password_digest, :string
  	add_column :receivers, :remember_digest, :string
  end
end
