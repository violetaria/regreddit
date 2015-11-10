require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_new_valid_user
    user = User.new(email: "user3",
                    username: "userthree",
                    password: "password")
    assert user.valid?
  end

  def test_new_user_invalid_email
    user = User.new(username: "userthree",
                    password: "password")
    refute user.valid?
  end

  def test_new_user_invalid_username
    user = User.new(email: "user3",
                    password: "password")
    refute user.valid?
  end

  def test_new_user_invalid_password
    user = User.new(username: "userthree",
                    email: "user3")
    refute user.valid?
  end

end
