class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Hello comment was posted dude"}
      else
        format.html { render action: "new"}
      end
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

end