class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!, only: [:destroy]
  before_action :set_forum_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: %i[ edit update destroy]
  def create
    @forum_post = ForumPost.find(params[:forum_post_id])
    pilot_profile = current_user.pilot_profile
    @comment = @forum_post.comments.build(comment_params.merge(pilot_profile: pilot_profile))
    if @comment.save 
      redirect_to @forum_post, notice: "Comment Added!"
    else
      redirect_to @forum_post, alert: "Failed to add comment"
  end
end

  def edit
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment Updated." }
        format.json { render :show, status: :ok, location: @comment}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy 
    if @comment.destroy
      redirect_to @forum_post, notice: "Comment Deleted"
    else
      redirect_to @forum_post, alert: "Failed To Delete Comment"
    end
  end

private

  def set_forum_post
    @forum_post = ForumPost.find(params[:forum_post_id])
  end

  def set_comment
    @comment = @forum_post.comments.find(params[:id])
  end

  def comment_params
  params.require(:comment).permit(:body)
  end

  def authorize_user!
  unless @comment.pilot_profile == current_pilot_profile || current_user.admin? || current_user.super_admin?
    redirect_to forum_posts_path, alert: "You are not authorized to do this!" 
    end
  end

  def authorize_admin!
    unless current_user.admin? || current_user.super_admin?
      redirect_to forum_posts_path, alert: "You are not authorized to do this!"
    end
  end

end
