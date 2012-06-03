class AddFrontPageToArtworks < ActiveRecord::Migration
  def self.up
    add_column :artworks, :front_page, :boolean
  end

  def self.down
    remove_column :artworks, :front_page
  end
end
