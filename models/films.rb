require_relative('../db/sql_runner')

class Film 

  attr_reader :id
  attr_accessor :title, :price 

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{ @title }', #{ @price }) RETURNING id"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def update()
    updating = 
    "UPDATE films
    SET (title, price) =
    ('#{@title}', #{@price})
    WHERE id = #{@id};"
    SqlRunner.run ( updating )
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new( film ) }
    return result
  end

  def self.delete_all
    deleting = "DELETE FROM films;"
    SqlRunner.run ( deleting )  
  end

end