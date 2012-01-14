class SitemapController < ApplicationController
  layout nil

  def index
    @artworks = Artwork.all
    @articles = Article.all
    headers["Content-Type"] = "text/xml"
    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end