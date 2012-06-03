class AdminController < ApplicationController
  before_filter :authenticate_user!
	
  def index
  	@galleries = Gallery.all_cached
  	@artworks = Artwork.all_cached
  	@articles = Article.all
  	
  	@artwork = Artwork.new
  	@gallery = Gallery.new
  end
  
  def frontpage
  	@gallery = Gallery.find(params[:id])
  	@artworks = @gallery.artworks
  	respond_to do | format |  
      format.js {render :layout => false}  
    end
  end
end