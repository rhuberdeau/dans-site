class GallerySweeper < ActionController::Caching::Sweeper
  observe Gallery
  
  def after_save(gallery)
    expire_cache(gallery)
  end
  
  def after_destroy(gallery)
    expire_cache(gallery)
  end
  
  def expire_cache(gallery)
  	expire_page(:controller => 'galleries', :action => 'index')
  	expire_page(:controller => 'galleries', :action => 'show', :id => gallery)
    expire_fragment :header
  end
end