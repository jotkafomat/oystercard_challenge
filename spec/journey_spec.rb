require "journey"

describe Journey do
  let(:entry_station) { double(:station) }
  let(:oystercard) { double :oystercard }

  before do
    allow(oystercard).to receive(:touch_in).and_return(entry_station)
  end

  describe "#start_journey" do

  end

    it "can store a entry station" do

    end

  it "can store an exit station" do
  end

  it "returns the minimum fare if journey completed correctly" do
  end

  it "returns the penalty fare if journey is incomplete" do
  end
end
