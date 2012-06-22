class AddArtworkCountToGallery < ActiveRecord::Migration
  def self.up
  	add_column :galleries, :artworks_count, :integer, :default => 0

    Gallery.reset_column_information
    Gallery.find_each do |g|
      Gallery.reset_counters g.id, :artworks
    end
  end

  def self.down
  	remove_column :galleries, :artworks_count
  end
end
