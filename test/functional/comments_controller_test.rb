require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:post_one)
    @comment = comments(:comment_one)
  end

  test "should not create comment with blank fields" do
    assert_no_difference('Comment.count') do
      post :create, post_id: @post.id, comment: { content: '', name: '' }
    end

    assert_response :success

    assert_equal 2, assigns(:comment).errors.size 
    assert_present assigns(:comment).errors[:content]
    assert_present assigns(:comment).errors[:name]
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, post_id: @post.id, comment: { content: @comment.content, name: @comment.name }
    end

    assert_redirected_to post_path(@post)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, post_id: @post.id, id: @comment
    end

    assert_redirected_to post_path(@post)
  end
end
