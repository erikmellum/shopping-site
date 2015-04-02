class AddMemberReferenceToMilestone < ActiveRecord::Migration
  def change
    add_column :milestones, :member_id, :integer
  end
end
