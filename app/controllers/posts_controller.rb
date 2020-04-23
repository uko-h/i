class PostsController < ApplicationController
  before_action :set_category
  before_action :set_post_info,only: [:edit, :update]

  def index
    @new_post = @category.posts.new
    @posts = Post.where(user_id:current_user.id,category_id:@category)
    @posts.ids.each do |post|
    end
  end

  def create
    @new_post = @category.posts.new(post_params)
    if @new_post.save
      respond_to do |format|
        format.html {redirect_to user_category_posts_path(user_id:current_user.id,category_id:@category)}
        format.json
      end
    else
      render :index
    end
  end

  def edit
  end

  def update
    @post_info = Post.find_by(id: params[:id]) 
    if @post_info.update(post_params)
      redirect_to user_category_posts_path(user_id:current_user.id,category_id:@category)
    else
      render :index
    end
  end

  def destroy
    @post_info = Post.find_by(id: params[:id]) 
    if @post_info.destroy
      redirect_to user_category_posts_path(user_id:current_user.id,category_id:@category)
    else
      redirect_to edit_product_path(@product.id)
    end
  end

  def destroy_all
    @posts = Post.where(user_id:current_user.id,category_id:@category)
    @posts.destroy_all
    redirect_to user_category_posts_path(user_id:current_user.id,category_id:@category)
  end

  private

  def post_params
    params.require(:post).permit(:content, :image).merge(user_id:current_user.id,category_id:@category.id)
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_post_info
    @post_info = Post.find_by(id: params[:id])
  end
end
