class AddWidthToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :width, :integer
  end

  def self.down
    remove_column :products, :width
  end
end
