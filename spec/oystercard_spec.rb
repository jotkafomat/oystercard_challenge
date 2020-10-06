require 'oystercard'

describe Oystercard do
  it 'should have a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'should increase balance by 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

  it "should not exceed the balance of #{Oystercard::BALANCE_LIMIT}" do
    maximum_limit = Oystercard::BALANCE_LIMIT
    subject.top_up(maximum_limit)
    expect  {subject.top_up(1) }.to raise_error("Maximum balance is £#{subject.maximum_limit}.")
  end

  it 'initializes with a default in_use state of "false"' do
    expect(subject).to_not be_in_journey
  end
  describe '#deduct' do

    it 'deducts a fare from a balance' do
      subject.top_up(10)
      subject.touch_in
      expect { subject.touch_out }.to change {subject.balance}.by (-(Oystercard::MINIMUM_FARE))
    end
  end
  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }
    it 'changes card_use_status to "true" when called' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'raises error if insufficient funds on the card' do
      error_message = "Error: Unsufficient funds available. Minimum £#{Oystercard::MINIMUM_FARE} needed..."
      expect { subject.touch_in}.to raise_error(error_message)
    end
  end
  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }
    it 'changes card_use_status back to "false" when called' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end
  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }
    it 'displays card_use_status as "false" on initialization' do
      expect(subject).to_not be_in_journey
    end
    it 'displays card_use_status as "true" after touch_in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it 'displays card_use_status as "false" after touch_out' do
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end

end
