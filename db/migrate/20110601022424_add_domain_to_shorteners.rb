class AddDomainToShorteners < ActiveRecord::Migration
  def self.up
    add_column :shorteners, :domain, :string
  end

  def self.down
    remove_column :shorteners, :domain
  end
end
