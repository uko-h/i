class PostsController < ApplicationController
  before_action :set_category

  def index
    @post = Post.new
    @posts = @category.posts.includes(:user)
  end

  def create
    @posts = @category.posts.new(post_params)
    if @posts.save
      redirect_to category_posts_path(@category)
    else
      @posts = @category.posts.includes(:user)
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end
end
