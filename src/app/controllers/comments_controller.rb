class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @forum_post = ForumPost.find(params[:forum_post_id])
    @comment = @forum_post.comments.build(comment_params.merge(pilot_profile: current_pilot_profile))
    if @comment.save 
      redirect_to @forum_post, notice: "Comment Added!"
    else
      redirect_to @forum_post, alert: "Failed to add comment"
  end
end

private

def comment_params
  params.require(:comment).permit(:body)
  end
end
