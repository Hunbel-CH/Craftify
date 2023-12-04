require "test_helper"

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shopping_carts_show_url
    assert_response :success
  end

  test "should get add_item" do
    get shopping_carts_add_item_url
    assert_response :success
  end

  test "should get remove_item" do
    get shopping_carts_remove_item_url
    assert_response :success
  end
end
