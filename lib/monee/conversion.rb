module Conversion
  def convert_to(new_currency)
    return self if self.currency == new_currency

    exchange_rate  = get_exchange_rate(self.currency, new_currency)
    current_amount = self.amount
    new_amount     = current_amount * exchange_rate

    Monee::Money.new(new_amount, new_currency)
  end

  def get_exchange_rate(currency, new_currency)
    if Monee::RATES.has_key?(currency) && Monee::RATES[currency].has_key?(new_currency)
      Monee::RATES[currency][new_currency]
    else
      raise "No exchange rate set!"
    end
  end
end
