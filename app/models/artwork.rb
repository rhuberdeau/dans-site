class Artwork < ActiveRecord::Base
  has_attached_file :photo, 
  					:styles => { :small => "215x120>" }, 
  					:storage => :s3,
     				:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
     				:path => ":attachment/:id/:style/:filename"
  belongs_to :gallery
end
