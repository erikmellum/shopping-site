class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :family_name, :string
    add_column :users, :family_key, :integer
  end
end
