require 'account'
require 'history'
require 'printer'

describe 'Bank Account', :feature do

  it 'Logs a deposit transaction correctly' do
    date = Time.now.strftime('%d/%m/%Y')
    history = History.new
    printer = Printer.new
    account = Account.new(history, printer)
    account.deposit(10)
    expect(history.transaction_history).to eq(
      [{date: date, credit: 10, debit: 0, balance: 10}]
    )
  end

  it 'Logs a withdrawal transaction as well as a deposit transaction' do
    date = Time.now.strftime('%d/%m/%Y')
    history = History.new
    printer = Printer.new
    account = Account.new(history, printer)
    account.deposit(20)
    account.withdraw(10)
    expect(history.transaction_history).to eq(
      [{date: date, credit: 20, debit: 0, balance: 20},
       {date: date, credit: 0, debit: 10, balance: 10}]
    )
  end
end
