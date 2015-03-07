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
    assert cart
    product = products(:ruby)
    assert product.id
    cart.save
    3.times { cart.add_product product.id }
    cart.save
    line_item = cart.line_items.find_by_product_id product.id
    line_item.save
    cart.add_product product.id
    cart.save

    assert line_item, "line item not created"
    assert_equal product.title, line_item.product.title, "cart line item product is incorrect"
  end

end
