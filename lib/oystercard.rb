class Oystercard
  attr_reader :balance, :maximum_limit, :entry_station, :trip, :journey_history

  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = INITIAL_BALANCE, maximum_limit = BALANCE_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
    @journey_history = []
  end

  def top_up(value)
    error_message = "Maximum balance is £#{maximum_limit}."
    raise error_message if (@balance + value) > @maximum_limit

    @balance += value
  end

  def touch_in(station)
    error_message = "Error: Unsufficient funds available. Minimum £#{MINIMUM_FARE} needed..."

    fail error_message if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @trip = { "entry_station" => entry_station, "exit_station" => station }
    @journey_history << @trip
    @entry_station = nil
  end

  def in_journey?
    # It returns true if the
    # object on the right is not nil and not false,
    # false if it is nil or false
    !!entry_station
  end

  private

  def deduct(amount = 0)
    @balance -= amount
  end
end
