class Oystercard
  attr_reader :balance, :maximum_limit

  INITIAL_BALANCE = 0
  BALANCE_LIMIT = 90

  def initialize(balance = INITIAL_BALANCE, maximum_limit = BALANCE_LIMIT)
    @balance = balance
    @maximum_limit = maximum_limit
  end

  def top_up(value)
    raise "Maximum balance is £#{maximum_limit}." if (@balance + value) > @maximum_limit

    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end
end
