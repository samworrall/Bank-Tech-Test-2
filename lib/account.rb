class Account
  MINIMUM_BALANCE = 0
  attr_reader :balance

  def initialize(history, printer)
    @balance = MINIMUM_BALANCE
    @history = history
    @printer = printer
  end

  def deposit(amount)
    check_if_positive(amount)
    @balance += amount
    @history.log(amount)
  end

  def withdraw(amount)
    check_if_positive(amount)
    raise('Value exceeds current balance') if amount > @balance
    @balance -= amount
    @history.log(amount)
  end

  def print_statement
    @printer.pretty_print(@history)
  end

  private

  def check_if_positive(amount)
    raise('Value must be positive') if amount < 0
  end
end
