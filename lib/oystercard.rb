class Oystercard
  attr_reader :balance, :maximum_limit, :current_station

  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = INITIAL_BALANCE, maximum_limit = BALANCE_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
  end

  def top_up(value)
    raise "Maximum balance is £#{maximum_limit}." if (@balance + value) > @maximum_limit

    @balance += value
  end

  def touch_in(station)
    fail "Error: Unsufficient funds available. Minimum £1 needed..." if @balance < MINIMUM_FARE
    updates_station(station)
  end

  def touch_out
    deduct(MINIMUM_FARE)
    updates_station(nil)
  end

  def in_journey?
    !!current_station
  end

  def updates_station(entry_station)
    @current_station = entry_station
  end

  private
  def deduct(amount = 0)
    @balance -= amount
  end


end
