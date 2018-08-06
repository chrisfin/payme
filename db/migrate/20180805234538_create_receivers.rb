class CreateReceivers < ActiveRecord::Migration[5.1]
  def change
    create_table :receivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :app_name
      t.string :auth_code
      t.string :acc_id

      t.timestamps
    end
  end
end
