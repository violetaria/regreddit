require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can't create comment without user" do
    comment = Comment.new

    refute comment.save

    assert comment.errors[:user_id].present?
  end

  test "can't create comment without post" do
    comment = users(:one).comments.new

    refute comment.save

    assert comment.errors[:post_id].present?
  end

  test "can't create comment without content" do
    comment = users(:one).comments.new

    refute comment.save

    assert comment.errors[:content].present?
  end

  test "can create comment with user, post, and content" do
    comment = users(:one).comments.new(post_id: posts(:one).id, content: "yada yada yada")

    assert_difference "Comment.count" do
      comment.save
    end

  end
end
