class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :artworks
  end
end
