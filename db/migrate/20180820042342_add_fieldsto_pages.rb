class AddFieldstoPages < ActiveRecord::Migration[5.1]
   def change
  	add_column :pages, :name, :string
  	add_column :pages, :default_amount, :integer
  	add_column :pages, :custom_amount, :boolean
  end
end
