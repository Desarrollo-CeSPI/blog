class Tag < ActiveRecord::Base
  # attributes
  attr_accessible :name
  
  # associations
  has_and_belongs_to_many :posts
  
  # validations
  validates :name, presence: true, uniqueness: true
  
  def to_s
    name
  end
end
