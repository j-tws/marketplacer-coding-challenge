require_relative 'marketplace'
require 'json'

class App
  attr_reader :marketplace

  def initialize
    products_file = File.read('products.json')
    products = JSON.parse(products_file)
    @marketplace = Marketplace.new products
  end

  def menu 
    puts "Welcome to Marketplacer!"
    puts "The marketplace's list of products!"
    @marketplace.list_products
    puts "Please select an option to proceed:"
    p "1. Add item to cart"
    p "2. View cart"
  end

end

app = App.new
app.menu
