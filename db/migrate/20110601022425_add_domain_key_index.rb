class AddDomainKeyIndex < ActiveRecord::Migration
  def self.up
    add_index(:shorteners, [:domain, :key], :unique => true)
  end

  def self.down
    remove_index :shorteners, :column => [:domain, :key]
  end
end
