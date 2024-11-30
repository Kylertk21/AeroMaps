class ForumPostsController < ApplicationController
  before_action :set_forum_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :ensure_pilot_profile, except: [ :show, :index ]
  before_action :authorize_user!, only: %i[ edit update destroy]

  # GET /forum_posts or /forum_posts.json
  def index
    @forum_posts = ForumPost.all
  end

  # GET /forum_posts/1 or /forum_posts/1.json
  def show
    @forum_post = ForumPost.find(params[:id])
    @comments = @forum_post.comments
    @comment = Comment.new
  end

  # GET /forum_posts/new
  def new
    @forum_post = ForumPost.new
  end

  # GET /forum_posts/1/edit
  def edit
  end

  # POST /forum_posts or /forum_posts.json
  def create
    @forum_post = current_pilot_profile.forum_posts.build(forum_post_params)

    respond_to do |format|
      if @forum_post.save
        format.html { redirect_to @forum_post, notice: "Posted!" }
        format.json { render :show, status: :created, location: @forum_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_posts/1 or /forum_posts/1.json
  def update
    respond_to do |format|
      if @forum_post.update(forum_post_params)
        format.html { redirect_to @forum_post, notice: "Forum post was successfully updated." }
        format.json { render :show, status: :ok, location: @forum_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_posts/1 or /forum_posts/1.json
  def destroy
    @forum_post.destroy!

    respond_to do |format|
      format.html { redirect_to forum_posts_path, status: :see_other, notice: "Forum post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post
      @forum_post = ForumPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forum_post_params
      params.require(:forum_post).permit(:post_topic, :post_text)
    end

    def authorize_user!
      unless current_user.admin? || current_user.super_admin? || @forum_post.pilot_profile == current_pilot_profile
        redirect_to forum_posts_path, alert: "You are not authorized to do this!" 
      end
    end

end
