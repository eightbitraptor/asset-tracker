class HardwareType < ActiveRecord::Base
  has_many :hardware
  validates_presence_of :name, :manufacturer, :model_number
  validates_uniqueness_of :model_number
end
