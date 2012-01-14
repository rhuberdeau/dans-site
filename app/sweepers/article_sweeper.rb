class ArticleSweeper < ActionController::Caching::Sweeper
  observe Article
  
  def after_save(article)
    expire_cache_for(article)
  end
  
  def after_destroy(article)
    expire_cache_for(article)
  end
  
  def expire_cache_for(article)
  	expire_page '/index.html'
  	expire_action(:controller => '/articles', :action => 'show', :id => article)
    expire_fragment('header')
  end
end