class AddLengthToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :length, :integer
  end

  def self.down
    remove_column :products, :length
  end
end
