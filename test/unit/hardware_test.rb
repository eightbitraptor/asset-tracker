require 'test_helper'

class HardwareTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  test "validate presence of serial number" do
    hw = Factory :hardware
    hw.serial_number = ''
    assert_equal false, hw.valid?
  end
  
  test "validates presence of date_purchased" do
    hw = Factory :hardware
    hw.date_purchased = ''
    assert_equal false, hw.valid?
  end
  
  test "that valid hardware can be created successfully" do
    hw = Factory :hardware
    assert hw.save
  end
  
  test "that software belonging to hardware is reported correctly" do
    hw = Factory :hardware
    sw = Factory :software, :hardware_id => hw.id
    assert_equal [sw], hw.software
  end
  
  test "that reported software returns an empty array when there is no assigned software" do
    hw = Factory :hardware
    assert_equal [], hw.software
  end
  
  test "that array of software can be assigned to hardware" do
    hware = Factory :hardware
    some_software = []
    5.times do
      sw = Factory(:software, :serial => rand(100))
      some_software << sw
    end
    hware.assign(some_software)
    assert_equal some_software, hware.software
  end
end
