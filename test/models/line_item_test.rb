require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "LineItem price must be positive" do
    line_item = line_items(:one)
    line_item.price = -1
    assert line_item.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      line_item.errors[:price]

    line_item.price = 0
    assert line_item.invalid?
    assert_equal ["must be greater than or equal to 0.01"], 
      line_item.errors[:price]

    line_item.price = 1
    assert line_item.valid?
  end

end
