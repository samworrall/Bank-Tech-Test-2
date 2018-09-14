class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize
    @balance = MINIMUM_BALANCE
  end

  def deposit(amount)
    raise('Deposit value must be positive') if amount < 0
    @balance += amount
  end
end
