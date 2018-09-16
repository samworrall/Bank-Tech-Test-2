require 'account'
require 'history'
require 'printer'

describe 'Bank Account', :feature do
  before(:each) do
    @date = Time.now.strftime('%d/%m/%Y')
    @history = History.new
    @printer = Printer.new
    @account = Account.new(@history, @printer)
  end

  it 'Updates the account balance positively' do
    expect{ @account.deposit(10) }.to change{ @account.balance }.by(10)
  end

  it 'Updates the account balance negatively' do
    @account.deposit(10)
    expect{ @account.withdraw(10) }.to change{ @account.balance }.by(-10)
  end

  it 'Logs a deposit transaction correctly' do
    @account.deposit(10)
    expect(@history.transaction_history).to eq(
      [{date: @date, credit: 10, debit: 0, balance: 10}]
    )
  end

  it 'Logs a withdrawal transaction as well as a deposit transaction' do
    @account.deposit(20)
    @account.withdraw(10)
    expect(@history.transaction_history).to eq(
      [{date: @date, credit: 20, debit: 0, balance: 20},
       {date: @date, credit: 0, debit: 10, balance: 10}]
    )
  end

  it 'Throws an error when withdrawing more than the balance' do
    expect{ @account.withdraw(10) }.to raise_error('Value exceeds current balance')
  end

  it 'Throws an error when depositing a negative amount' do
    expect{ @account.deposit(-10) }.to raise_error('Value must be positive')
  end

  it 'Throws an error when withdrawing a negative amount' do
    expect{ @account.withdraw(-10) }.to raise_error('Value must be positive')
  end

  it 'Returns a full and correct statement' do
    @account.deposit(100)
    @account.withdraw(20)
    @account.withdraw(30)
    @account.deposit(20)
    expect{ @account.print_statement }.to output(
      <<~HEREDOC
      Date || Credit || Debit || Balance
      #{@date} || 20 || 0 || 70
      #{@date} || 0 || 30 || 50
      #{@date} || 0 || 20 || 80
      #{@date} || 100 || 0 || 100\n
      HEREDOC
    ).to_stdout
  end
end
