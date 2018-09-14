require 'history'

describe History do
  describe '#transaction_history', :t_hist do
    it 'Returns an empty array on initialisation' do
      expect(subject.transaction_history).to eq([])
    end

    it 'Contains hash elements once they have been added' do
      subject.log('14/09/2018', 10, 0, 10)
      expect(subject.transaction_history).to eq([{date: '14/09/2018', credit: 10, debit: 0, balance: 10}])
    end
  end

  describe '#log', :log do
    it 'Increases the transaction_history by 1' do
      expect{ subject.log('14/09/2018', 10, 0, 10) }.to change{ subject.transaction_history.length }.by(1)
    end
  end
end
