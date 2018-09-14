require 'account'

describe Account do
  describe '#balance', :balance do
    it 'Returns the current balance of the account' do
      expect(subject.balance).to eq(0)
    end
  end
end
