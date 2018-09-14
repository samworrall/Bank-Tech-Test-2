class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize
    @balance = MINIMUM_BALANCE
  end

  def deposit(amount)
    raise('Value must be positive') if amount < 0
    @balance += amount
  end

  def withdraw(amount)
    raise('Value must be positive') if amount < 0
    raise('Value exceeds current balance') if amount > @balance
    @balance -= amount
  end
end
