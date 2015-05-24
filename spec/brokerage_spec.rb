require_relative 'spec_helper'

describe Brokerage do

	let (:brokerage) {Brokerage.new(name: 'Future Proof', clients: ['Cajsa Carlson'])}

	let (:client) {Client.new(name: 'Cajsa Carlson', balance: 10000, portfolios:{tech: []})}
	
	it 'should be able to create account for client' do
		client = 'Christin Yu'
		brokerage.add_client(client)
		expect(brokerage.clients.include?('Christin Yu')).to eq true
	end


	it 'should be able to list all clients' do
		expect(brokerage.list_clients(client)).to eq ["Cajsa Carlson", 10000]
	end
end