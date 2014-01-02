require '/Users/alexmac/RSpec/spec/spec_helper.rb'
# reading data from file
File.open('/Users/alexmac/RSpec/data.txt', 'r').each_line do |line|
  given = line.chomp.split(',')
  actual = []
describe 'Sliders' do
  before { goto 'http://demos.kendoui.com/web/slider/index.html' }
  output = 'allows to set value ' + given.to_s + ' and get the same value '
  it output do
# setting sliders to data
    (0..5).each do |i|
      if i == 0 # balance slider
        path = "//*[@id='wrapper']/div[1]/div/div/a"
      else # equalizer sliders
        path ="//*[@id='equalizer']/div[" + i.to_s + "]/div/div/a"
      end
      val = link(:xpath => path).attribute_value('aria-valuenow')
      while val.to_i < given[i].to_i
        link(:xpath => path).send_keys :arrow_up
        val =  link(:xpath => path).attribute_value('aria-valuenow')
      end
      while val.to_i > given[i].to_i
        link(:xpath => path).send_keys :arrow_down
        val = link(:xpath => path).attribute_value('aria-valuenow')
      end
# reading data from sliders
      actual << link(:xpath => path).attribute_value('aria-valuenow')
    end
# comparing given data and actual data
    actual.should == given
  end

end
end
