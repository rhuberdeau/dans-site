class ArtworkSweeper < ActionController::Caching::Sweeper
  observe Artwork
  
  def after_save(artwork)
    expire_cache_for(artwork)
  end
  
  def after_destroy(artwork)
    expire_cache_for(artwork)
  end
  
  def expire_cache_for(artwork)
  	expire_page(:controller => '/artworks', :action => 'index')
  	expire_page '/index.html'
  	expire_page(:controller => '/artworks', :action => 'show', :id => artwork)
    expire_fragment('header')
  end
end