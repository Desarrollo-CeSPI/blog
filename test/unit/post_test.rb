require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'present attributes' do
    post = Post.new
    
    assert post.invalid?
    assert_equal 2, post.errors.size
    assert_present post.errors[:content]
    assert_present post.errors[:title]
  end
  
  test 'unique attributes' do
    post = Post.new
    post.content = posts(:one).content
    post.title = posts(:one).title

    assert post.invalid?
    assert_equal 1, post.errors.size
    assert_present post.errors[:title]
  end
end
