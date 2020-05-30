require_relative('../db/sql_runner.rb')
# require_relative('./note.rb')

class Bake

attr_accessor :id, :bake_date, :score, :starter_time,
              :leaven_time, :autolyse_time, :add_salt_time,
              :bulk_time, :shape_time, :prove_time, :bake_time, :cool_time
              # :note_id,:image_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @bake_date = options['bake_date']
    @score = options['score']
    @starter_time = options['starter_time']
    @leaven_time = options['leaven_time']
    @autolyse_time = options['autolyse_time']
    @add_salt_time = options['add_salt_time']
    @bulk_time = options['bulk_time']
    @shape_time = options['shape_time']
    @prove_time = options['prove_time']
    @bake_time = options['bake_time']
    @cool_time = options['cool_time']
    # @note_id = options['note_id'].to_i
    # @image_id = options['image_id'].to_i
  end

  def save()
    sql = "INSERT INTO bakes (bake_date, score, starter_time, leaven_time,
          autolyse_time, add_salt_time, bulk_time, shape_time, prove_time,
          bake_time, cool_time
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
    RETURNING id"
    values = [@bake_date, @score, @starter_time, @leaven_time,
              @autolyse_time, @add_salt_time, @bulk_time, @shape_time,
              @prove_time, @bake_time, @cool_time]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

# => Delete bake by id
  def delete()
    sql = " DELETE FROM bakes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# =>  Find bake by note ??? do I need this one ??
# def find_bake()
#   sql = "SELECT * FROM bakes INNER JOIN bakes ON houses.id = students.house_id WHERE students.id = $1"
#   values = [@id]
#   result = SqlRunner.run(sql, values)
#   return result.map { |house| House.new(house) }
# end

# =>  Find all bakes - returning all bakes
  def self.find_all()
    sql = " SELECT * FROM bakes"
    result = SqlRunner.run(sql)
    bakes = result.map { |bake| Bake.new(bake) }
    return bake
  end

# => Find bake by ID - returning one bake
  def self.find_by_id(id)
    sql = "SELECT * FROM bakes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Bake.new(result.first)
  end

# =>  Delete all bakes from db
  def self.delete_all()
    sql= "DELETE FROM bakes"
    SqlRunner.run(sql)
  end


end
