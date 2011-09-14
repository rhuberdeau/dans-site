class Gallery < ActiveRecord::Base
  attr_accessible :name
  
  has_many :artworks
  
  validates :name, :presence => true,
                   :uniqueness => { :case_sensitive => false }
  
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
