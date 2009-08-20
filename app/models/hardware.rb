class Hardware < ActiveRecord::Base
  belongs_to :hardware_type
  has_many :software
  belongs_to :user
  
  validates_uniqueness_of :serial_number
  validates_presence_of :serial_number, :date_purchased

  def assign(software)
    software.each { |sw|
      sw.hardware_id = self['id']
      sw.save
    }
  end
end
