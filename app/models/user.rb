class User < ActiveRecord::Base
  #has_many :hardware
  validates_presence_of :firstname, :surname
  
  def left_yet?
    if self['left_on'].blank?
      "#{self['name']} is still working here"
    else
      "#{self['name']} left reevoo on #{self['left_on'].strftime("%d %B %Y")}"
    end
  end
  
  def nice_name
    "#{self['firstname']} #{self['surname']}"
  end
end
