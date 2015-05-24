class Brokerage

	attr_accessor :name, :clients

	def initialize (options = {})
		@name = options[:name]
		@clients = options[:clients]
	end

	def add_client (client)
		@clients << client
	end

	def list_clients (client)
		@clients.map {|client| client} << client.balance
	end

end