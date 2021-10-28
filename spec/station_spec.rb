require 'station'

describe Station do
  before(:each) do
  @zone = double('zone')
  @name = double('name')
  @station = Station.new(@name, @zone)
  end
  it 'tells you what name station youre in' do
    expect(@station.name).to eq @name
  end
  it 'tells you what zone youre in' do
    expect(@station.zone).to eq @zone
  end
end