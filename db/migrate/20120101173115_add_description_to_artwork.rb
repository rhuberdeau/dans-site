class AddDescriptionToArtwork < ActiveRecord::Migration
  def self.up
    add_column :artworks, :description, :string
  end

  def self.down
    remove_column :artworks, :description
  end
end
