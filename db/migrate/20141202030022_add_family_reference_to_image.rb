class AddFamilyReferenceToImage < ActiveRecord::Migration
  def change
    add_column :images, :family_id, :integer
  end
end
