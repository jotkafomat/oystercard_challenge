# frozen_string_literal: true

require_relative "./lib/oystercard.rb"

p my_oyster_card = Oystercard.new
p "this is balance"
p my_oyster_card.balance
p my_oyster_card.top_up(20)
# p my_oyster_card.top_up(100)
# p my_oyster_card.deduct(2)
p my_oyster_card.touch_in("tulse hill")
p my_oyster_card.entry_station
p my_oyster_card.in_journey?
p my_oyster_card.touch_out("victoria station")
p my_oyster_card.journey_history
