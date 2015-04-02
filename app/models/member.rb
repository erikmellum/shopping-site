class Member < ActiveRecord::Base
  belongs_to :family
  has_many :member_ones, :class_name => 'Relationship', :foreign_key => 'member_one', dependent: :destroy
  has_many :member_twos, :class_name => 'Relationship', :foreign_key => 'member_two', dependent: :destroy
  has_many :images
  has_many :milestones, dependent: :destroy
  has_many :hobbies, dependent: :destroy
end
