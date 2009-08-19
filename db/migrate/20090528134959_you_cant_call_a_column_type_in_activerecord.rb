class YouCantCallAColumnTypeInActiverecord < ActiveRecord::Migration
  def self.up
    rename_column :hardware_types, :type, :hardware_type
  end

  def self.down
    rename_column :hardware_types, :hardware_type, :type
  end
end
