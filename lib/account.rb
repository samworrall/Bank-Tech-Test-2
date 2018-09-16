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
    @history.log(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance)
  end

  def withdraw(amount)
    check_if_positive(amount)
    raise('Value exceeds current balance') if amount > @balance
    @balance -= amount
    @history.log(Time.now.strftime('%d/%m/%Y'), 0, amount, @balance)
  end

  def print_statement
    puts @printer.pretty_print(@history)
  end

  private

  def check_if_positive(amount)
    raise('Value must be positive') if amount < 0
  end
end
