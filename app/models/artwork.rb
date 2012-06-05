class Artwork < ActiveRecord::Base
  has_attached_file :photo,
  					:whiny => false, 
  					:styles => { :small => "215x120>", :large => "300x250>" }, 
  					:storage => :s3,
     				:s3_credentials => "#{RAILS_ROOT}/config/aws.yml",
     				:path => ":attachment/:id/:style/:filename"
     				
     				
  belongs_to :gallery
  belongs_to :category
  
  before_create :set_up_permalink
  after_save    :expire_artwork_all_cache
  after_destroy :expire_artwork_all_cache

  validates :name, :presence => true,
  				   :uniqueness => { :case_sensitive => false }
  validates :description, :length => { :maximum => 100 }
  
  scope :front_page, where(:front_page => true) 
  
  def to_param
  	permalink
  end
  
  def self.all_cached
    Rails.cache.fetch('Artwork.all') { all }
  end
  
  private
  
  def set_up_permalink
  	permalink = self.name.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
  	permalink = permalink.downcase
    self.permalink = permalink
  end
  
  def expire_artwork_all_cache
    Rails.cache.delete('Artwork.all')
  end
end
