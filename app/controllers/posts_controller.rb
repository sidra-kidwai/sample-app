class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @posts = Post.all.page(params[:page]).per(2)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC").page(params[:page]).per(5)
    end
  end

  def show
    @commentable = @post
    @comments = @commentable.comments.page(params[:page]).per(2)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @attachments = @post.attachments.build
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to @post, notice: "The post was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Update successful!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post destroyed!"
  end

private

  def post_params
    params.require(:post).permit(:title, :picture, :content, :category_id, attachments_attributes: [:file])
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
