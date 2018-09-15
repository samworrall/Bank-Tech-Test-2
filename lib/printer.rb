class Printer
  def pretty_print(history)
    printed_statement = "Date || Credit || Debit || Balance\n"
    history.reverse.each do |transaction|
      printed_statement += "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    puts printed_statement
  end
end
