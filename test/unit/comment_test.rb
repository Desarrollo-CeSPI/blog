require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'present attributes' do
    comment = Comment.new
    
    assert comment.invalid?
    assert_equal 4, comment.errors.size
    assert_present comment.errors[:content]
    assert_present comment.errors[:name]
    assert_present comment.errors[:post_id]
    assert_present comment.errors[:post]
  end
end
