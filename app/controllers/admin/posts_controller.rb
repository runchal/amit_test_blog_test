class Admin::PostsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
    end
  end

  def create
    @post = current_admin.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_posts_path, notice: 'Good job creating your post. You must be some sort of genius.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def new
    @post = current_admin.posts.new(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_posts_path, notice: 'Your post was successfully updated. Admins rule.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html {redirect_to admin_posts_path}
    end
  end
end
