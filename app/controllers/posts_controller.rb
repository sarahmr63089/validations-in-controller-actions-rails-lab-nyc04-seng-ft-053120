class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @errors = flash[:errors]
  end

  def update
    # binding.pry
    if @post.update(post_params)
      redirect_to post_path(@post)
    else  
      flash[:errors] = @post.errors.full_messages
      render :edit
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
