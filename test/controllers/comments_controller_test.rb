require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "users can create comments while logged in" do
    login_user_one!

    assert_difference "Comment.count" do
      post :create, { id: posts(:one).id, content: "Test content" }
    end

    assert_response :found # 302

    assert_not_nil assigns(:post)

    assert_redirected_to comments_show_path(assigns(:post))
  end

  test "users cannot create comments while not logged in" do
    assert_no_difference "Comment.count" do
      post :create, { id: posts(:one).id, content: "Test content" }
    end

    assert_response :found # 302

    assert_redirected_to login_path
  end

  test "users can show comments while not logged in" do
    get :show, { id: posts(:one).id }

    assert_response :ok # 200

    assert_not_nil assigns(:post)

    assert_not_nil assigns(:comments)
  end

  test "users can delete their comments while logged in" do
    login_user_one!

    assert_difference "Comment.count", -1 do
      delete :delete, { id: posts(:one).id, comment_id: comments(:one).id }
    end

    assert_response :found

    assert_not_nil assigns(:post)

    assert_redirected_to comments_show_path(assigns(:post))

  end

  test "users cannot delete comments while not logged in" do
    assert_no_difference "Comment.count" do
      delete :delete, { id: posts(:one).id, comment_id: comments(:one).id }
    end

    assert_response :found # 302

    assert_redirected_to login_path
  end

  test "users cannot delete other users comments while logged in" do
    login_user_two!

    assert_no_difference "Comment.count" do
      delete :delete, { id: posts(:one).id, comment_id: comments(:one).id }
    end

    assert_response :unauthorized

    response.status = :found
    assert_redirected_to comments_show_path(assigns(:post))
  end

  private
  def login_user_one!
    session[:user_id] = users(:one).id
  end

  def login_user_two!
    session[:user_id] = users(:two).id
  end

end