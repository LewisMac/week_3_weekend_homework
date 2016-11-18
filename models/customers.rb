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
    sql = "INSERT INTO customers (name, funds) VALUES ('#{ @name }', '#{ @funds }') RETURNING id"
    location = SqlRunner.run( sql ).first
    @id = location['id'].to_i
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end