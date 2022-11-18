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
      150 => 0.5,
      100 => 0.8,
      50 => 0.85,
      20 => 0.9,
      0 => 1
    }

  end
  
  def add_item(num)
    unless @products[num - 1].nil?
      item = @products[num - 1]
      @cart << @products[num - 1]
      item
    end
  end
  
  def remove_item(num)
    unless @cart[num - 1].nil?
      item = @cart[num - 1]
      @cart.delete_at(num - 1)
      item
    end
  end

  def next_discount
    array = @discount.keys.select do |discount|
      self.cart_total < discount
    end
    array.last
  end

  def next_discount_message

    if next_discount.nil?
      return "No further discount after"
    end

    amount_needed = next_discount - cart_total 
    "Buy $#{amount_needed.to_i} more to get #{(100 - (@discount[next_discount] * 100)).to_i}% off"
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
    # discount = @discount.select { |key| key.include? self.cart_total }
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

# binding.pry

