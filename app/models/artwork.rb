class Artwork < ActiveRecord::Base
  has_attached_file :photo, :styles => { :thumb => "215x120>" }, 
  					:storage => :s3,
     				:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
     				:path => "/:style/:id/:filename"
end
