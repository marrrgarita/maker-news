class CommentsController < ApplicationController
  before_action :ensure_login
  before_action :find_comment, except: [:create]
  before_action :ensure_ownership, except: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_ownership
    redirect_to root_path unless current_user == @comment.user
  end

end
