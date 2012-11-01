class Comment < ActiveRecord::Base
  # attributes
  attr_accessible :content, :name, :post_id
  
  # associations
  belongs_to :post

  # validations
  validates :content, presence: true
  validates :name, presence: true
  validates :post_id, presence: true
  validates :post, presence: true
end
