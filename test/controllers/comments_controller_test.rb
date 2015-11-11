require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "can create comments" do
    session[:user_id] = users(:one).id
    assert_difference "Comment.count" do
      post :create, { id: posts(:one).id, content: "Test content" }
    end

    assert_response :found # 302

    assert_not_nil assigns(:post)

    assert_redirected_to comments_show_path(assigns(:post))
  end

  test "can show comments" do

  end

end