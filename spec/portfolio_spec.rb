require_relative 'spec_helper'

describe Portfolio do

	let (:stock) {Stock.new}
	let (:portfolio) {Portfolio.new}

	it 'should be able to buy stock' do
		portfolio.buy(stock)
		expect(portfolio.stock_count).to eq 1
	end

	it 'should be able to sell stock' do
		portfolio.buy(stock)
		portfolio.sell(stock)
		expect(portfolio.stock_count).to eq 0
	end

	it 'should list all stocks' do
		stock1 = Stock.new({no_of_shares: 10, stock_name: 'AATI', share_price: 36.2 })
		stock2 = Stock.new({no_of_shares:20, stock_name: 'AAL', share_price: 42.61})
		portfolio.buy(stock1)
		portfolio.buy(stock2)
		expect(portfolio.list_all_stocks).to eq ['AATI', 'AAL']  
	end
end