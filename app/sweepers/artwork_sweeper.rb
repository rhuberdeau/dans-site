class ArtworkSweeper < ActionController::Caching::Sweeper
  observe Artwork
  
  def after_save(artwork)
    expire_cache_for(artwork)
  end
  
  def after_destroy(artwork)
    expire_cache_for(artwork)
  end
  
  def expire_cache_for(artwork)
  	expire_action(:controller => 'artworks', :action => 'index')
  	expire_page '/index.html'
  	expire_action(:controller => 'artworks', :action => 'show', :id => artwork)
    expire_fragment('header')
    unless artwork.gallery.nil?
    	gallery = artwork.gallery
    	expire_action(:controller => 'galleries', :action => 'show', :id => gallery)
    end
  end
end