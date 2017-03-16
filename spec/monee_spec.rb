require 'spec_helper'

describe Monee::Money do
  context 'creating money' do
    before do
      @ten_euros = Monee::Money.new(10, "eur")
    end

    it 'executes inspect as a string' do
      expect(@ten_euros.inspect).to be_a(String)
    end

    it 'has amount method that returns float number' do
      expect(@ten_euros.amount).to be_a(Float)
      expect(@ten_euros.amount).to eq(10.to_f)
    end

    it 'has currency method that returns string' do
      expect(@ten_euros.currency).to be_a(String)
    end

    it 'returns currency as a capitalised symbol' do
      expect(@ten_euros.currency).to eq("EUR")
    end
  end
end
