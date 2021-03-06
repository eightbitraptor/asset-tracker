class CreateSoftwares < ActiveRecord::Migration
  def self.up
    create_table :softwares do |t|
      t.string :name
      t.string :serial
      t.datetime :date_purchased
      t.integer :hardware_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :softwares
  end
end
