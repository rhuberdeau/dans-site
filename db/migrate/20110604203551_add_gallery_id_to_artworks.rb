class AddGalleryIdToArtworks < ActiveRecord::Migration
  def self.up
    add_column :artworks, :gallery_id, :integer
    add_index :artworks, :gallery_id
  end

  def self.down
    remove_column :artworks, :gallery_id
  end
end
