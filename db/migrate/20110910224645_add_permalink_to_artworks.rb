class AddPermalinkToArtworks < ActiveRecord::Migration
  def self.up
    add_column :artworks, :permalink, :string
    add_index :artworks, :permalink
  end

  def self.down
    remove_column :artworks, :permalink
  end
end
