require 'marketplace'

RSpec.describe Marketplace do

  test_products = [
    {"name" => "Bread", "price" => "10.40"},
    {"name" => "Jam", "price" => "5.30"},
    {"name" => "Saffron", "price" => "120"},
    {"name" => "Truffle", "price" => "60"}
  ]

  
  it "should have a list of products" do
    test_marketplace = Marketplace.new test_products
    expect(test_marketplace.products).to eq(test_products)
  end

  it "should have a cart" do
    test_marketplace = Marketplace.new test_products
    expect(test_marketplace.cart.empty?).to eq(true)
  end

  it "cart should have items after adding items into it" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 1
    expect(test_marketplace.cart[0]["name"]).to eq("Bread")
  end

  it "cart should not allow to add invalid product" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 7
    expect(test_marketplace.cart.length).to eq(0)
  end

  it "cart should have correct amount of items" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 1
    test_marketplace.add_item 2
    expect(test_marketplace.cart.length).to eq(2)
  end
  
  it "can remove items from cart" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 2
    test_marketplace.add_item 1
    test_marketplace.add_item 1
    test_marketplace.remove_item 1
    test_marketplace.remove_item 1
    expect(test_marketplace.cart.length).to eq(1)
  end

  it "cannot remove item that does not exist" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 2
    test_marketplace.remove_item 1
    test_marketplace.remove_item 1
    expect(test_marketplace.cart.length).to eq(0)
  end
  
  it "can calculate total amount in cart" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 1
    test_marketplace.add_item 2
    expect(test_marketplace.cart_total).to eq(15.70)
  end
  
  it "can calculate total after discount" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 1
    test_marketplace.add_item 1
    test_marketplace.add_item 2
    discount = test_marketplace.cart_total_after_discount
    expect(discount["cart_total_after_discount"]).to eq(23.49)
  end
  
  it "can calculate 20% discount" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 3
    discount = test_marketplace.cart_total_after_discount
    
    expect(discount["cart_total_after_discount"]).to eq(96)
  end
  
  it "can calculate 15% discount" do
    test_marketplace = Marketplace.new test_products
    test_marketplace.add_item 4
    discount = test_marketplace.cart_total_after_discount
    expect(discount["cart_total_after_discount"]).to eq(51)
  end

end