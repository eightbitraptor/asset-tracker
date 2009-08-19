class User < ActiveRecord::Base
  has_many :hardware
  validates_presence_of :firstname, :surname
end
