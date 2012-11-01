require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test 'present attributes' do
    tag = Tag.new
    
    assert tag.invalid?
    assert_equal 1, tag.errors.size
    assert_present tag.errors[:name]
  end
  
  test 'unique attributes' do
    tag = Tag.new
    tag.name = tags(:one).name
    
    assert tag.invalid?
    assert_equal 1, tag.errors.size
    assert_present tag.errors[:name]
  end
end
