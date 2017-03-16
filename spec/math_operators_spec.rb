require 'spec_helper'

describe MathOperators do
  context 'math operations' do
    before do
      @fifty_eur = Monee::Money.new(50, "EUR")
    end

    it 'allows to divide money' do
      twenty_five = @fifty_eur / 2
      expect(twenty_five).to be_an_instance_of(Monee::Money)
      expect(twenty_five.currency).to eq("EUR")
      expect(twenty_five.amount).to eq(25) 
    end

    it 'allows to multiply money' do
      two_hundred = @fifty_eur * 4
      expect(two_hundred).to be_an_instance_of(Monee::Money)
      expect(two_hundred.currency).to eq("EUR")
      expect(two_hundred.amount).to eq(200) 
    end

    context 'on the same currency' do
      before do
        @ten_eur   = Monee::Money.new(10, "EUR")
        @fifty_eur = Monee::Money.new(50, "EUR")
      end

      it 'executes addition' do
        sixty_eur = @fifty_eur + @ten_eur
        expect(sixty_eur).to be_an_instance_of(Monee::Money)
        expect(sixty_eur.currency).to eq("EUR")
        expect(sixty_eur.amount).to eq(60)
      end

      it 'executes subtraction' do
        forty_eur = @fifty_eur - @ten_eur
        expect(forty_eur).to be_an_instance_of(Monee::Money)
        expect(forty_eur.currency).to eq("EUR")
        expect(forty_eur.amount).to eq(40)
      end

      it 'compares values' do
        result1 = @ten_eur < @fifty_eur
        result2 = @ten_eur == @fifty_eur
        expect(result1).to be(true)
        expect(result2).to be(false)
      end
    end

    context 'on different currencies' do
      before do
        Monee::Money.conversion_rates(
          "EUR", { "PLN" => 4.35 }
        )
        Monee::Money.conversion_rates(
          "PLN", { "EUR" => 0.23 }
        )
        @ten_eur = Monee::Money.new(10, "EUR")
        @ten_pln = Monee::Money.new(10, "PLN")
      end

      it 'executes addition and keeps the original currency' do
        pln_plus_eur = @ten_pln + @ten_eur
        expect(pln_plus_eur.currency).to eq("PLN")
        expect(pln_plus_eur.amount).to eq(53.5)
      end

      it 'executes subtraction and keeps the original currency' do
        eur_minus_pln = @ten_eur - @ten_pln
        expect(eur_minus_pln.currency).to eq("EUR")
        expect(eur_minus_pln.amount).to eq(7.7)
      end

      it 'compares values' do
        ten_eur_in_pln = @ten_eur.convert_to("PLN")
        twenty_euros = @ten_eur + @ten_eur
        result1 = ten_eur_in_pln == @ten_eur
        result2 = twenty_euros > ten_eur_in_pln
        expect(result1).to be(true)
        expect(result2).to be(true)
      end
    end
  end
end
