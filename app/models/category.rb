class Category < ActiveRecord::Base
  has_many :artworks
  accepts_nested_attributes_for :artworks
  
  validates :name, :presence => true
end
