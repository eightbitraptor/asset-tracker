require 'test_helper'

class HardwareTypeTest < ActiveSupport::TestCase
  test "saving a valid Hardware Type" do
    hwt = Factory :hardware_type
    assert hwt.save
  end
  
  test "presence of name" do
    hwt = Factory :hardware_type
    hwt.name = ''
    assert hwt.save ==false
  end
  
  test "presence of manufacturer" do
    hwt = Factory :hardware_type
    hwt.manufacturer = ''
    assert hwt.save ==false
  end
  
  test "presence of model number" do
    hwt = Factory :hardware_type
    hwt.model_number = ''
    assert hwt.save ==false
  end

end
