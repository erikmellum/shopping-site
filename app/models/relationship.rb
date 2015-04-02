class Relationship < ActiveRecord::Base
  belongs_to :member_one, :class_name => 'member', :foreign_key => 'member_one_id'
  belongs_to :member_two, :class_name => 'member', :foreign_key => 'member_two_id'
end
