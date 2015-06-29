require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "adding product increase it's quantity" do
    cart = carts(:one)
    product_id = products(:i7_2820).id
    
    quantity_before = cart.product_quantity(product_id)
    cart.add_product(product_id)
    cart.save()
    
    quantity_after = cart.product_quantity(product_id)
    
    assert quantity_after - quantity_before == 1, 
      "after adding the product quantity should increase #{products(:i7_2820).title}: #{quantity_before}, #{quantity_after} "
  end

  test "adding the same products doesn't increase line item count" do
    cart = carts(:one)
    product_id = products(:i7_2820).id

    cart.add_product(product_id)
    cart.save()
    
    line_items_before = cart.line_items.count
    
    cart.add_product(product_id)
    cart.add_product(product_id)
    cart.add_product(product_id)
    cart.save()

    line_items_after = cart.line_items.count
    
    assert line_items_before == line_items_after, 
      "adding the same products doesn't increase line item count"
  end

  test "adding the different products increase line item count" do
    cart = carts(:one)
    cart.destroy( )
    
    assert cart.line_items.count == 0,
      "empty cart should have no line_items #{cart.line_items.count}" 

    cart.add_product(products(:i7_2820).id)
    cart.add_product(products(:i7_2820_1).id)
    cart.save()
    
    assert cart.line_items.count == 2,
      "after adding two different products increase line item count #{cart.line_items.count}" 
    
  end
end
