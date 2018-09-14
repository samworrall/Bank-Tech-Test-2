require 'history'

describe History do
  describe '#transaction_history', :t_hist do
    it 'Returns an empty array on initialisation' do
      expect(subject.transaction_history).to eq([])
    end
  end

  describe '#log', :log do
    it 'Increases the transaction_history by 1' do
      expect{ subject.log('14/09/2018', 10, 0, 10) }.to change{ subject.transaction_history.length }.by(1)
    end
  end
end
