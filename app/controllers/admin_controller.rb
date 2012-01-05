class AdminController < ApplicationController
  before_filter :authenticate_user!
	
  def index
  	@galleries = Gallery.all_cached
  	@artworks = Artwork.all_cached
  	@articles = Article.all
  end
end
