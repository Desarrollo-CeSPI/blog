require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create post with blank fields" do
    assert_no_difference('Post.count') do
      post :create, post: { content: '', title: '' }
    end

    assert_response :success
    
    assert_equal 2, assigns(:post).errors.size
    assert_present assigns(:post).errors[:content]
    assert_present assigns(:post).errors[:title]
  end

  test "should not create post with non unique fields" do
    assert_no_difference('Post.count') do
      post :create, post: { content: 'Post two', title: 'Post two' }
    end

    assert_response :success
    
    assert_equal 1, assigns(:post).errors.size
    assert_present assigns(:post).errors[:title]
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { content: 'Post three', title: 'Post three' }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should not update post with blank fields" do
    assert_no_difference('Post.count') do
      post :create, post: { content: '', title: '' }
    end

    assert_response :success
    
    assert_equal 2, assigns(:post).errors.size
    assert_present assigns(:post).errors[:content]
    assert_present assigns(:post).errors[:title]
  end

  test "should not update post with non unique fields" do
    assert_no_difference('Post.count') do
      post :create, post: { content: @post.content, title: 'Post two' }
    end

    assert_response :success
    
    assert_equal 1, assigns(:post).errors.size
    assert_present assigns(:post).errors[:title]
  end

  test "should update post" do
    put :update, id: @post, post: { content: @post.content, title: @post.title }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
