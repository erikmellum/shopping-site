class AddMemberReferenceToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :member_one, :integer
    add_column :relationships, :member_two, :integer
  end
end
