class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.integer :receiver_id
      t.string :recurring
      t.boolean :card
      t.boolean :ach

      t.timestamps
    end
  end
end
