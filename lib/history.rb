class History
  attr_reader :transaction_history

  def initialize
    @transaction_history = []
  end

  def log(date, credit, debit, balance)
    @transaction_history.push({
      date: date,
      credit: credit,
      debit: debit,
      balance: balance
      })
  end
end
