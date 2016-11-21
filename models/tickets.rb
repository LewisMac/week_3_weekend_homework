require_relative("../db/sql_runner")
require_relative('customers')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize( options )
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end


  def save()
    sql =
    "INSERT INTO tickets (customer_id, film_id)
    VALUES ('#{@customer_id}', '#{@film_id}')
    RETURNING *"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i

    for film in Film.all
      if film.id == @film_id
        film_price = film.price
      end
    end
    for customer in Customer.all
      if customer.id == @customer_id
        customer_funds = customer.funds
        break
      end
    end

    new_funds = customer_funds.to_i - film_price.to_i
    customer.update(new_funds)
  end

  # def self.reduce_funds
  #   new_funds = customer['funds'] - film['price']
  #   return Customer.update_funds("#{new_funds}")
  # end

  #   sql = "UPDATE customer c
  # SET c.funds = c.funds - f.price
  #   INNER JOIN films f ON
  #   c.id = f.customer_id
  #   "
  #   return SqlRunner.run(sql)

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket ) }
    return result
  end

  def self.delete_all() 
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end