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
  'funds' => 4
  })
customer2.save

customer1.funds = 20
customer1.update



binding.pry
nil