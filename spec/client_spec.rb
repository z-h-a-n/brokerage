require_relative 'spec_helper'

describe Client do

	let (:client) {Client.new(name: 'Cajsa Carlson', balance: 10000, portfolios:{tech: []})}

	let (:stock) {Stock.new(no_of_shares: 10, stock_name: 'AATI', share_price: 36.2 )}

	it 'should be able to create a portfolio' do
		portfolio = { finance: [] }
		expect(client.create(portfolio).has_key?(:finance)).to eq true
	end

	it 'should add stock to a portfolio' do
		portfolio = :finance
		expect(client.add_stock(portfolio, stock).include?('AATI')).to eq true
	end

	it 'should subtract purchase amount from balance' do
		expect(client.post_purchase_bal(stock)).to eq (10000 - (stock.no_of_shares * stock.share_price))
	end

	it 'should delete/sell a stock from a portfolio' do
		client1 = Client.new({name: 'Cajsa Carlson', balance: 10000, portfolios:{tech: [], finance:['AATI']}})
		portfolio = :finance
		client1.sell_stock(portfolio, stock)
		expect(client1.portfolios[portfolio].include?('AATI')).to eq false

	end

	it 'should add proceeds to balance' do
		expect(client.post_sales_bal(stock)).to eq (10000 + (stock.no_of_shares * stock.share_price))
	end

	it 'should list all portfolios and their value' do
		client1 = Client.new({name: 'Cajsa Carlson', balance: 10000, portfolios:{tech: [], finance:['AATI']}})

		expect(client1.portfolio_list).to eq "tech, finance"

	end

end