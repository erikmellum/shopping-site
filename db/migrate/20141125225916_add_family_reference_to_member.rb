class AddFamilyReferenceToMember < ActiveRecord::Migration
  def change
    add_column :members, :Member, :string
    add_reference :members, :family, index: true
  end
end
