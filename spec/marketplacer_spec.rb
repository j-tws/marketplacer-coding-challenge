require 'marketplace'

RSpec.describe Marketplace do

  test_products = [
    {"name" => "product_one", "price" => "10"},
    {"name" => "product_two", "price" => "5"}
  ]
  test_marketplace = Marketplace.new test_products

  it "should have a list of products" do
    expect(test_marketplace.products).to eq(test_products)
  end


end