class BlogController < ApplicationController
  def index
  	@posts = Post.where(published: true).order("updated_at DESC")

  	respond_to do |format|
  		format.html
  		format.json { render json:@posts }
  		format.atom
  	end
  end
end
