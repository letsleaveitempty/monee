module MathOperators
  include Comparable

  def +(another_money)
    new_amount = self.amount + converted_amount(another_money)
    Monee::Money.new(new_amount, self.currency)
  end

  def -(another_money)
    new_amount = self.amount - converted_amount(another_money)
    Monee::Money.new(new_amount, self.currency) 
  end

  def /(number)
    new_amount = self.amount / number
    Monee::Money.new(new_amount, self.currency)
  end

  def *(number)
    new_amount = self.amount * number
    Monee::Money.new(new_amount, self.currency)
  end

  def <=>(another_money)
    if self.amount > converted_amount(another_money)
      1
    elsif self.amount < converted_amount(another_money)
      -1
    else
      0
    end
  end

  private

    def converted_amount(some_money)
      some_money.convert_to(self.currency).amount
    end
end
