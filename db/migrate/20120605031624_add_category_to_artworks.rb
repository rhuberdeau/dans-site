class AddCategoryToArtworks < ActiveRecord::Migration
  def self.up
    add_column :artworks, :category_id, :integer
    add_index :artworks, :category_id
  end

  def self.down
    remove_column :artworks, :category_id
  end
end
