class PostsController < ApplicationController

  def index
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(params[:post])
    redirect_to post_url(post)
  end
    
end
