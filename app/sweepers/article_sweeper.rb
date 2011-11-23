class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article
  
  def after_save(article)
    expire_cache(article)
  end
  
  def after_destroy(article)
    expire_cache(article)
  end
  
  def expire_cache(article)
    expire_fragment :header
  end
end