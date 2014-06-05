class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post }
        format.js      
      else
        format.html { redirect_to @comment.post, alert: "Comment not created. All fields must be filled"}      
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end