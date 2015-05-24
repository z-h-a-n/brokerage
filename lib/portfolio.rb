class Portfolio

	attr_accessor :name, :stocks

	def initialize (options = {})
		@name = options[:name]
		@stocks = options[:stocks] || []
	end

	def buy stock
		@stocks << stock
	end

	def stock_count
		@stocks.count
	end

	def sell stock
		@stocks.delete(stock)
	end

	def list_all_stocks
		@stocks.map(&:stock_name)
	end

end