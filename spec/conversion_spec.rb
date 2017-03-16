require 'spec_helper'

describe Conversion do
  context 'setting conversion rates' do
    before do
      Monee::Money.conversion_rates(
        "EUR", { "PLN" => 4.35, "GBP" => 0.85 }
      )
    end

    it 'sets new currency' do
      rates = Monee::RATES
      expect(rates).not_to be_empty
      expect(rates['EUR']['PLN']).to eq(4.35)
    end

    it 'adds another currency' do
      Monee::Money.conversion_rates(
        "PLN", { "EUR" => 0.23, "GBP" => 0.2 }
      )
      rates = Monee::RATES
      expect(rates).not_to be_empty
      expect(rates['PLN']['GBP']).to eq(0.2)
    end
  end

  context 'converting currency' do
    before do
      Monee::Money.conversion_rates(
        "EUR", { "PLN" => 4, "XYZ" => 0.5 }
      )
      @twenty_eur = Monee::Money.new(20, "EUR")
    end

    it 'converts to correct amount and currency' do
      twenty_eur_in_pln = @twenty_eur.convert_to("PLN")
      expect(twenty_eur_in_pln).to be_an_instance_of(Monee::Money)
      expect(twenty_eur_in_pln.amount).to eq(80)
      expect(twenty_eur_in_pln.currency).to eq("PLN")
    end

    it 'raises an error if the exchange rate is not set' do
      expect { @twenty_eur.convert_to("GBP") }.to raise_error("No exchange rate set!")
    end
  end
end
