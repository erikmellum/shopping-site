class Image < ActiveRecord::Base
  belongs_to :member
  belongs_to :event
  belongs_to :family
  has_many :tags, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :filename, presence: true
  def generate_filename
    write_attribute(:filename, ('a'..'z').to_a.shuffle[0,8].join)
  end
  
 
end
