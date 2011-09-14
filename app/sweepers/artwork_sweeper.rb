class ArtworkSweeper < ActionController::Caching::Sweeper
  observe Artwork
  
  def after_save(artwork)
    expire_cache(artwork)
  end
  
  def after_destroy(artwork)
    expire_cache(artwork)
  end
  
  def expire_cache(artwork)
    expire_fragment 'top_nav'
  end
end