require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_new_valid_post
    post = users(:userone).posts.new(url: "http://www.test.com",
                                     title: "Test Title")

    assert post.valid?
  end
end
