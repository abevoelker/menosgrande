class AddKeyUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :shorteners, :key, :unique => true
  end

  def self.down
    remove_index :shorteners, :key
  end
end
