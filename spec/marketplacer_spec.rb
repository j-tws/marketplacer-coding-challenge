require 'marketplace'

RSpec.describe Marketplace do

  test_products = [
    {"name" => "Bread", "price" => "10"},
    {"name" => "Jam", "price" => "5"}
  ]
  test_marketplace = Marketplace.new test_products

  it "should have a list of products" do
    expect(test_marketplace.products).to eq(test_products)
  end

  # it "should list out each product info for user" do
  #   expect(test_marketplace.list).to eq()
  # end


end