require 'marketplace'

RSpec.describe Marketplace do

  test_products = [
    {"name" => "Bread", "price" => "10.40"},
    {"name" => "Jam", "price" => "5.30"}
  ]

  test_marketplace = Marketplace.new test_products

  it "should have a list of products" do
    expect(test_marketplace.products).to eq(test_products)
  end

  # it "should list out each product info for user" do
  #   expect(test_marketplace.list).to eq()
  # end

  it "should have a cart" do
    expect(test_marketplace.cart.empty?).to eq(true)
  end

  it "cart should have items after adding items into it" do
    test_marketplace.add_item 1
    expect(test_marketplace.cart[0]["name"]).to eq("Bread")
  end

  it "cart should have correct amount of items" do
    expect(test_marketplace.cart.length).to eq(1)
  end

  it "can remove items from cart" do
    test_marketplace.remove_item 1
    expect(test_marketplace.cart.length).to eq(0)
  end

  it "can calculate total amount in cart" do
    test_marketplace.add_item 1
    test_marketplace.add_item 2
    expect(test_marketplace.cart_total).to eq(15.70)
  end

  it "can calculate total after discount" do
    test_marketplace.add_item 1
    expect(test_marketplace.cart_total_after_discount).to eq(23.49)
  end

end