require './Oystercard.rb'

describe Oystercard do

  it 'should have a balance of zero' do

    my_oyster_card = Oystercard.new
    expect(my_oyster_card.balance).to eq 0
  end
end
