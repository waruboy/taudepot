require 'test_helper'

class CartTest < ActiveSupport::TestCase



  test "cart line item should save price" do 
    cart = carts(:default)
    [:ruby, :one, :ruby].each do |item_symbol|
      product = products(item_symbol)
      line_item = cart.add_product(product.id)
      assert_equal product.price, line_item.price
    end
  end

  test "cart line quantity should increment" do
    cart = carts(:default)
    product = products(:ruby)
    3.times { cart.add_product product.id }
    line_item = cart.line_items.find_by_product_id product.id
    assert_equal 3, line_item.quantity, "cart line item quantity is incorrect"
  end

end
