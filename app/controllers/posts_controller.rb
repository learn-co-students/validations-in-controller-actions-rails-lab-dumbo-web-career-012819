class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    set_post!
  end

  def edit
    set_post!
  end

  def update
    @post = set_post!
    @post.update(post_params)
    if @post.valid? == false
      render :edit
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
