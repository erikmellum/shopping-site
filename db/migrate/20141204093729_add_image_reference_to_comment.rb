class AddImageReferenceToComment < ActiveRecord::Migration
  def change
    add_column :comments, :image_id, :comment
  end
end
