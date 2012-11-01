class Post < ActiveRecord::Base
  # attributes
  attr_accessible :content, :title, :tag_ids

  # associations
  has_and_belongs_to_many :tags
  has_many :comments

  # validations
  validates :content, presence: true
  validates :title, presence: true, uniqueness: true
end
