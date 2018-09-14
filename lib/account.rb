class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize
    @balance = MINIMUM_BALANCE
  end

  def deposit(amount)
    check_if_positive(amount)
    @balance += amount
  end

  def withdraw(amount)
    check_if_positive(amount)
    raise('Value exceeds current balance') if amount > @balance
    @balance -= amount
  end

  def check_if_positive(amount)
    raise('Value must be positive') if amount < 0
  end
end
