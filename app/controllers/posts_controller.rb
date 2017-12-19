class PostsController < ApplicationController
  before_action :ensure_login, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_ownership, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url)
  end

  def ensure_ownership
    redirect_to root_path unless current_user == @post.user
  end

end
