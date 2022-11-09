require 'app'

RSpec.describe App do

  test_app = App.new

  it 'should have a menu method as main display' do
    expect(test_app.methods.include?(:menu)).to eq(true)
  end

  it 'menu should print out a list of products' do
    expect(run_command("ruby main.rb")).to have_output("Welcome to Marketplacer!")
  end

end