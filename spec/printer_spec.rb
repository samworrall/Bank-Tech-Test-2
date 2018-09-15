require 'printer'

describe Printer do
  let(:history) { [{date: '15/09/2018',credit: 10, debit: 0, balance: 10},
                   {date: '16/09/2018', credit: 0, debit: 10, balance: 0}] }

  describe '#pretty_print', :pretty_print do
    it 'Pretty prints a full history' do
      expect { subject.pretty_print(history) }.to output(
        <<~HEREDOC
        Date || Credit || Debit || Balance
        16/09/2018 || 0 || 10 || 0
        15/09/2018 || 10 || 0 || 10
        HEREDOC
      ).to_stdout
    end
  end
end
