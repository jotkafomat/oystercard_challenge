class Oystercard
  attr_reader :balance, :maximum_limit

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

  def touch_in
    fail "Error: Unsufficient funds available. Minimum £1 needed..." if @balance < MINIMUM_FARE
    @card_use_status = true

  end

  def touch_out
    deduct(MINIMUM_FARE)
    @card_use_status = false
  end

  def in_journey?
    @card_use_status
  end
  private
  def deduct(amount = 0)
    @balance -= amount
  end

end
