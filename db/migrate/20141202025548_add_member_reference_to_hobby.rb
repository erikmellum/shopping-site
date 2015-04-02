class AddMemberReferenceToHobby < ActiveRecord::Migration
  def change
    add_column :hobbies, :member_id, :integer
  end
end
