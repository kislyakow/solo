class BlogController < ApplicationController
  def index
  	@posts = Post.where(published: true)

  	respond_to do |format|
  		format.html
  		format.json { render json:@posts }
  		format.atom
  	end
  end
end
