class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
    end
  end

  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Good job creating your post. You must be some sort of genius.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def new
    @post = current_user.posts.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Your post was successfully updated. Dummy.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html {redirect_to posts_url}
    end
  end
end