require 'account'

describe Account do
  describe '#balance', :balance do
    it 'Returns the minimum balance upon initialisation' do
      expect(subject.balance).to eq(Account::MINIMUM_BALANCE)
    end

    it 'Returns the current balance of the account' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#deposit', :deposit do
    it 'Increases the account balance by 10' do
      expect{ subject.deposit(10) }.to change{ subject.balance }.by(10)
    end

    it 'Raises an error when depositing a negative amount' do
      expect{ subject.deposit(-10) }.to raise_error('Value must be positive')
    end
  end

  describe '#withdraw', :withdraw do
    it 'Decreases the account balance by 10' do
      subject.deposit(10)
      expect{ subject.withdraw(10) }.to change{ subject.balance }.by(-10)
    end

    it 'Raises an error when withdrawing a negative amount' do
      expect{ subject.withdraw(-10) }.to raise_error('Value must be positive')
    end

    it 'Raises an error if withdraw amount exceeds balance' do
      subject.deposit(10)
      expect{ subject.withdraw(20) }.to raise_error('Value exceeds current balance')
    end
  end
end
