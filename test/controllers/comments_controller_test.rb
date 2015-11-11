require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "can create comments while logged in" do
    session[:user_id] = users(:one).id
    assert_difference "Comment.count" do
      post :create, { id: posts(:one).id, content: "Test content" }
    end

    assert_response :found # 302

    assert_not_nil assigns(:post)

    assert_redirected_to comments_show_path(assigns(:post))
  end

  test "cannot create comments while not logged in" do
    assert_no_difference "Comment.count" do
      post :create, { id: posts(:one).id, content: "Test content" }
    end

    assert_response :found # 302

    assert_redirected_to login_path
  end

  test "can show comments while not logged in" do
    get :show, { id: posts(:one).id }

    assert_response :ok # 200

    assert_not_nil assigns(:post)

    assert_not_nil assigns(:comments)
  end

  test "can delete their comments while logged in" do
    session[:user_id] = users(:one).id

    assert_difference "Comment.count", -1 do
      delete :delete, { id: posts(:one).id, comment_id: comments(:one).id }
    end

    assert_response :found #302

    assert_not_nil assigns(:post)

    assert_redirected_to comments_show_path(assigns(:post))

  end

end