class CreateHardwareTypes < ActiveRecord::Migration
  def self.up
    create_table :hardware_types do |t|
      t.string :name
      t.string :manufacturer
      t.string :model_number
      t.timestamps
    end
  end

  def self.down
    drop_table :hardware_types
  end
end
