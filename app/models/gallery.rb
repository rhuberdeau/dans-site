class Gallery < ActiveRecord::Base
  attr_accessible :name
  
  has_many :artworks
  
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
  
  before_create :set_up_permalink
  after_save    :expire_gallery_all_cache
  after_destroy :expire_gallery_all_cache
                   
  def to_param
  	permalink
  end
  
  def self.all_cached
    Rails.cache.fetch('Gallery.all') { all }
  end
  
  private
  
  def set_up_permalink
  	permalink = self.name.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
  	permalink = permalink.downcase
    self.permalink = permalink
  end
  
  def expire_gallery_all_cache
    Rails.cache.delete('Gallery.all')
  end
end
