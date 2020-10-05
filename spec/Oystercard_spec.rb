require './Oystercard.rb'

describe Oystercard do

  it 'should have a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'should increase balance by 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

    it 'should not exceed the balance of £90' do

      expect { subject.top_up(100) }.to raise_error "Maximum balance is £#{subject.maximum_limit}. You can top up only £#{subject.maximum_limit - subject.balance}"
    end

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deduct a fare from the balance' do
      subject.top_up(20)
      expect(subject.deduct(2)).to eq 18
    end

end
