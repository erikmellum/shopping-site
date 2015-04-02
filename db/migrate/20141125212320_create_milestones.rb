class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :date
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
