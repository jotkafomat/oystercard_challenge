require './Oystercard.rb'

describe Oystercard do

  it 'should have a balance of zero' do
    expect(subject.balance).to eq 0
  end

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'shoud increase balance by 20' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

end
