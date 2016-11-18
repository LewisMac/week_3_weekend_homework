require_relative('../db/sql_runner')

class Customer 

  attr_reader :id
  attr_accessor :name, :funds 

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', #{ @funds }) RETURNING id"
    location = SqlRunner.run( sql ).first
    @id = location['id'].to_i
  end

  def update
    updating = 
    "UPDATE customers
    SET (name, funds) =
    ('#{@name}', #{@funds})
    WHERE id = #{@id};"
    SqlRunner.run ( updating )
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new( customer ) }
    return result
  end

  def self.delete_all
    deleting = "DELETE FROM customers;"
    SqlRunner.run ( deleting )  
  end

end