require_relative('../db/sql_runner.rb')
require_relative('./note.rb')

require ('pry')

class Bake

attr_accessor :id, :bake_date, :score, :starter_time,
              :leaven_time, :autolyse_time, :add_salt_time,
              :bulk_time, :shape_time, :prove_time, :bake_time,
              :cool_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @bake_date = options['bake_date']
    @score = options['score'].to_i
    @starter_time = options['starter_time']
    @leaven_time = options['leaven_time']
    @autolyse_time = options['autolyse_time']
    @add_salt_time = options['add_salt_time']
    @bulk_time = options['bulk_time']
    @shape_time = options['shape_time']
    @prove_time = options['prove_time']
    @bake_time = options['bake_time']
    @cool_time = options['cool_time']
  end

  def save()
    sql = "INSERT INTO bakes (bake_date, score, starter_time, leaven_time,
          autolyse_time, add_salt_time, bulk_time, shape_time, prove_time,
          bake_time, cool_time)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
          RETURNING id"
    values = [@bake_date, @score, @starter_time, @leaven_time,
              @autolyse_time, @add_salt_time, @bulk_time, @shape_time,
              @prove_time, @bake_time, @cool_time]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

# =>  Method to update the bake table
  def update()
    sql = "UPDATE bakes SET (bake_date, score, starter_time, leaven_time,
          autolyse_time, add_salt_time, bulk_time, shape_time, prove_time,
          bake_time, cool_time)
          = ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
          WHERE id = $12"
    values = [@bake_date, @score, @starter_time, @leaven_time,
              @autolyse_time, @add_salt_time, @bulk_time, @shape_time,
              @prove_time, @bake_time, @cool_time, @id]
    SqlRunner.run(sql,values)
  end

# => find note from bake
  # def note()
  #   sql = "SELECT * FROM notes WHERE id = $1"
  #   values = [@note_tag]
  #   results = SqlRunner.run(sql, values)
  #   note_data = results[0]
  #   note = Note.new(note_data)
  # end

# => Delete bake by id
  def delete()
    sql = " DELETE FROM bakes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# => class functions

# =>  Find all bakes - returning all bakes
  def self.find_all()
    sql = " SELECT * FROM bakes"
    result = SqlRunner.run(sql)
    bakes = result.map {|bake| Bake.new(bake)}
    return bakes
  end

# => Find bake by ID - returning one bake
  def self.find(id)
    sql = "SELECT * FROM bakes WHERE id = $1"
    values = [id]
    bake_hash = SqlRunner.run(sql,values).first
    return Bake.new(bake_hash)
  end

# =>  Delete all bakes from db
  def self.delete_all()
    sql= "DELETE FROM bakes"
    SqlRunner.run(sql)
  end

# =>  Find the note relating to that bake id
  def notes()
    sql = "SELECT * from notes WHERE bake_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    notes = results.map{|note| Note.new(note)}
    return notes
  end


end
