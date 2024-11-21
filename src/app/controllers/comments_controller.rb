class CommentsController < ApplicationController
  def create
    @forum_post = ForumPost.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save 
      redirect_to @forum_post, notice: "Comment Added!"
    else
      render 'forum_posts/show'
  end
end

private

def comment_params
  params.require(:comment).permit(:body)
  end
end
