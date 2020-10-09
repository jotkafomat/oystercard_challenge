require 'station'

describe Station do

  let(:station_name) { double :string }
  let(:station_zone) { double :number }

  let(:station) { Station.new(station_name, station_zone) }

  it " initializes with name" do
    expect(station.name).to eq(station_name)
  end

  it " initializes with zone" do
    expect(station.zone).to eq(station_zone)
  end

end
