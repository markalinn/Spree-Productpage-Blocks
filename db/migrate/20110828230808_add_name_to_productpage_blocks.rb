class AddNameToProductpageBlocks < ActiveRecord::Migration
  def self.up
    add_column :productpage_blocks, :name, :string
  end

  def self.down
    remove_column :productpage_blocks, :name
  end
end
