require_relative 'spec_helper'

describe Stock  do
	
	it 'should provide the total price of shares' do
		stock = Stock.new({no_of_shares: 10, stock_name: 'AATI', share_price: 36.2 })
		expect(stock.calc_price_of_shares ).to eq 362
	end





end