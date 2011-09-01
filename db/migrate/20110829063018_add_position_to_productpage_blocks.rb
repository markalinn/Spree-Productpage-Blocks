class AddPositionToProductpageBlocks < ActiveRecord::Migration
  def self.up
    add_column :productpage_blocks, :position, :integer
  end

  def self.down
    remove_column :productpage_blocks, :position
  end
end
