require 'app'

RSpec.describe App do

  test_app = App.new

  it 'should have a menu method as main display' do
    expect(test_app.methods.include?(:menu)).to eq(true)
  end

end