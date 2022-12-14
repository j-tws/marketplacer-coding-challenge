require 'app'

RSpec.describe App do

  
  it 'should have a menu method as main display' do
    test_app = App.new 
    expect(test_app.methods.include?(:menu)).to eq(true)
  end
  
  it 'should not accept invalid command' do
    test_app = App.new
    
    # ??
    expect do
      test_app.run_command("100")
    end.to output("\e[1;31;49mPlease select valid option\e[0m\n").to_stdout
  end

  it 'should quit after user input 3' do
    test_app = App.new
    
    expect do
      test_app.run_command("3")
    end.to output("\e[1;32;49mPleasure doing business with you!\e[0m\n").to_stdout
  end

end