require "journey"

describe Journey do
  let(:entry_station) { double(:station) }

  describe "#start_journey" do
    subject.start_journey(:entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it "can store a entry station" do
    subject.entry_station = station
  end

  it "can store an exit station" do
  end

  it "returns the minimum fare if journey completed correctly" do
  end

  it "returns the penalty fare if journey is incomplete" do
  end
end
