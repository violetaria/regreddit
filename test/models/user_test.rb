require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  ## TODO write one test
  def test_can_create_valid_user
    user = User.new(email: "user3",
                    username: "userthree",
                    password: "password")
    assert user.valid?
  end
end
