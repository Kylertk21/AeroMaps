require "application_system_test_case"

class ForumPostsTest < ApplicationSystemTestCase
  setup do
    @forum_post = forum_posts(:one)
  end

  test "visiting the index" do
    visit forum_posts_url
    assert_selector "h1", text: "Forum posts"
  end

  test "should create forum post" do
    visit forum_posts_url
    click_on "New forum post"

    fill_in "Comments", with: @forum_post.comments
    fill_in "Post text", with: @forum_post.post_text
    fill_in "Post topic", with: @forum_post.post_topic
    click_on "Create Forum post"

    assert_text "Forum post was successfully created"
    click_on "Back"
  end

  test "should update Forum post" do
    visit forum_post_url(@forum_post)
    click_on "Edit this forum post", match: :first

    fill_in "Comments", with: @forum_post.comments
    fill_in "Post text", with: @forum_post.post_text
    fill_in "Post topic", with: @forum_post.post_topic
    click_on "Update Forum post"

    assert_text "Forum post was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum post" do
    visit forum_post_url(@forum_post)
    click_on "Destroy this forum post", match: :first

    assert_text "Forum post was successfully destroyed"
  end
end
