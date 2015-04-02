class AddFamilyReferenceToEvent < ActiveRecord::Migration
  def change
    add_column :events, :family_id, :integer
  end
end
