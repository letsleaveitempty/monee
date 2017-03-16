require 'monee/conversion'
require 'monee/math_operators'

module Monee

  RATES = {}

  class Money
    include Comparable
    include Conversion
    include MathOperators

    attr_accessor :amount, :currency

    def initialize(amount, currency)
      @amount   = amount.round(2)
      @currency = currency.upcase
    end

    def inspect
      "#{amount} #{currency}"
    end

    def self.conversion_rates(currency, rates = {})
      Monee::RATES.merge!({"#{currency}" => rates})
    end
  end
end
