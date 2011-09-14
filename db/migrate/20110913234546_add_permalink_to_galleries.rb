class AddPermalinkToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :permalink, :string
    add_index :galleries, :permalink
  end

  def self.down
    remove_column :galleries, :permalink
  end
end
