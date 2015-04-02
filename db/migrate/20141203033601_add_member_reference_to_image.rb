class AddMemberReferenceToImage < ActiveRecord::Migration
  def change
    add_column :images, :member_id, :integer
  end
end
