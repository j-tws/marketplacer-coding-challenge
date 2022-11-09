# About Marketplacer

# Marketplacer's core product is an e-commerce platform for online marketplaces that connects customers to a range of products to buy. We'd like you to build a checkout system for one of our marketplaces.
# The Challenge

# Your application should contain the following functionality:

#     Load a list of products from a file.
#     List product details to the user.
#     Add products to a Shopping Cart.
#     Apply promotional discounts.
#     Calculate and display the total cost.

# You can find the list of available products in the attached file products.json

# List of available promotions is provided below:

#     10% off on total greater than $20
#     15% off on total greater than $50
#     20% off on total greater than $100

# The output might but doesn't have to look like the one below:

# Products in Shopping Cart:
# 1. Jockey Wheels - Orange - $15.39
# 2. Chain Ring 146mm - $65.95
# 3. Carbon Brake Pads - $92.00
# 4. Front Derailleur - 34.9mm - $31.22

# Discount applied: 20% off on total greater than $100

# TOTAL: $163.65

# Happy coding and good luck! 🎉
# Recommendations

# We encourage you to include a README file with any additional information you would like to provide us with. It's a great place to include the getting started how-to, explain your design decisions etc. We recommend you submit your solution as a CLI application in the language your are most comfortable in, keeping in mind we predominantly use Ruby/Rails, Typescript/React, and a bit of Python. Remember to write a clean and well-structured solution and to commit early and often. Feel free to address the problem creatively and keep the extensibility in mind as we ask successful candidates to extend their implementation.

require 'json'
require 'pry'

class Marketplace

  attr_reader :products, :cart, :discount
  
  def initialize(products)
    @products = products
    @cart = []

    # Note: You can use ranges as keys in hash
    @discount = {
      # try to research to see if there's better way for 100..9999
      0..20 => 1,
      20..50 => 0.9,
      50..100 => 0.85,
      100..9999 => 0.8
    }
  end

  def list_products

    @products.each_with_index do |item, i|
      puts "#{i+1}. Item: #{item["name"]}, Price: #{item["price"]}" 
    end

    @products 
  end
  
  def add_item(num)
    @cart << @products[num - 1] unless @products[num - 1].nil?
  end

  def remove_item(num)
    @cart.delete_at(num - 1)
  end
  
  def list_cart
    @cart.each_with_index do |item, i|
      puts "#{i+1}. Item: #{item["name"]}, Price: $#{item["price"]}" 
    end

    @cart
  end

  def cart_total
    total = 0
    @cart.each { |item| total += item["price"].to_f}
    total
  end

  def cart_total_after_discount
    # Alternatively you can use 'case equality operator' aka '==='
    # it is used to define quality in the context of a case statement
    # i'll use include? just for better readability
    discount = @discount.select { |key| key.include? self.cart_total }
    (self.cart_total * discount.values.first).round(2)
  end

end

# binding.pry
