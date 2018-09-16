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
end
