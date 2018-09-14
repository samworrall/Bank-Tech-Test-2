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
      expect{subject.deposit(10)}.to change{subject.balance}.by(10)
    end
  end
end
