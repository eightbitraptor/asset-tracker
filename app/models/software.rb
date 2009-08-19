class Software < ActiveRecord::Base
  belongs_to :hardware
  belongs_to :user
  validates_uniqueness_of :serial
  validates_presence_of :date_purchased, :name
end
