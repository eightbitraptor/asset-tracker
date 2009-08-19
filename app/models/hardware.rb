class Hardware < ActiveRecord::Base
  belongs_to :hardware_type
  has_many :software
  belongs_to :user
end
