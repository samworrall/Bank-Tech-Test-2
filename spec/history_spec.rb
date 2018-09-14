require 'history'

describe History do
  describe '#transaction_history', :t_hist do
    it 'Returns an empty array on initialisation' do
      expect(subject.transaction_history).to eq([])
    end
  end
end
