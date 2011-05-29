class CreateShorteners < ActiveRecord::Migration
  def self.up
    create_table :shorteners do |t|
      t.string :url
      t.string :key

      t.timestamps
    end
  end

  def self.down
    drop_table :shorteners
  end
end
