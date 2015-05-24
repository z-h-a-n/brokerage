class Client

	attr_accessor :name, :balance, :portfolios

	def initialize (options = {})
		@name = options[:name]
		@balance = options[:balance]
		@portfolios = options[:portfolios] || {}
	end

	def create (portfolio)
		@portfolios.merge!(portfolio)
	end

	def add_stock (portfolio, stock)
		@portfolios.values_at(portfolio).push(stock.stock_name)
	end

	def post_purchase_bal (stock)
		@balance - stock.no_of_shares * stock.share_price
	end

	def sell_stock (portfolio, stock)
		@portfolios.values_at(portfolio)[0].delete(stock.stock_name)
	end

	def post_sales_bal (stock)
		@balance + stock.no_of_shares * stock.share_price
	end

	def portfolio_list
		@portfolios.keys.map(&:to_s).join(', ')

	end

end