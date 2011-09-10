class Artwork < ActiveRecord::Base
  has_attached_file :photo, 
  					:styles => { :small => "215x120>" }, 
  					:storage => :s3,
     				:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
     				:path => ":attachment/:id/:style/:filename"
  belongs_to :gallery
  
  before_create :set_up_permalink
  
  def to_param
  	permalink
  end
  
  private
  
  def set_up_permalink
  	permalink = self.name.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
    self.permalink = permalink
  end
end
