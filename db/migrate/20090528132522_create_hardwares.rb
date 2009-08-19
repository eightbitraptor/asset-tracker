class CreateHardwares < ActiveRecord::Migration
  def self.up
    create_table :hardwares do |t|
      t.string :serial_number
      t.datetime :date_purchased
      t.integer :user_id
      t.integer :hardware_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :hardwares
  end
end
