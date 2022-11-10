require 'json'
require 'pry'
require 'colorize'

class Marketplace

  attr_reader :products, :cart, :discount
  
  def initialize(products)
    @products = products
    @cart = []

    # Note: You can use ranges as keys in hash
    @discount = {
      # try to research to see if there's better way for 100..9999
      # 0..20 => 1,
      # 20..50 => 0.9,
      # 50..100 => 0.85,
      # 100..9999 => 0.8
      100 => 0.8,
      50 => 0.85,
      20 => 0.9,
      0 => 1
    }
  end

  def list_products

    @products.each_with_index do |item, i|
      puts "#{i+1}. Item: #{item["name"]}, Price: #{item["price"]}" 
    end

    @products 
  end
  
  def add_item(num)
    unless @products[num - 1].nil?
      puts "Successfully added #{@products[num - 1]["name"]} to cart".green.bold
      @cart << @products[num - 1]
    end
  end
  
  def remove_item(num)
    puts "Successfully removed #{@products[num - 1]["name"]} from cart".green.bold
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
    # discount = @discount.select { |key| key < self.cart_total }
    # (self.cart_total * discount.values.first).round(2)

    @discount.each do |total, discount|
      if self.cart_total > total
        return {
          "total_needed" => total, 
          "discount_rate" => discount,
          "cart_total_after_discount" => (self.cart_total * discount).round(2)
        }
      end
    end

  end

end

products_file = File.read('products.json')
products = JSON.parse(products_file)
marketplace = Marketplace.new products
marketplace.add_item(2)
marketplace.add_item(2)
marketplace.add_item(2)
marketplace.add_item(2)
# marketplace.add_item(2)
p marketplace.cart
# p marketplace.remove_item(5)


binding.pry

