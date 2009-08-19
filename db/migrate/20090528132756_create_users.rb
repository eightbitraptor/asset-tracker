class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :surname
      t.string :firstname
      t.string :email
      t.string :position
      t.datetime :joined_on
      t.datetime :left_on
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
