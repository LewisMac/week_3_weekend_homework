require_relative( 'models/customers' )
require_relative( 'models/films' )
require_relative( 'models/tickets' )

require( 'pry-byebug' )

Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({
  'name' => 'Spock',
  'funds' => 300
  })
customer1.save


customer2 = Customer.new({
  'name' => 'Kirk',
  'funds' => 40
  })
customer2.save

film1 = Film.new({
  'title' => 'Star Wars',
  'price' => 20
  })
film1.save





binding.pry
nil