require_relative('../db/sql_runner.rb')
require_relative('./bake.rb')

class Note

attr_accessor :id, :note_tag, :bake_id

# =>  Constructor
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @note_tag = options['note_tag']
    @bake_id = options['bake_id']
  end

  def save()
    sql = "INSERT INTO notes (note_tag, bake_id)
          VALUES ($1, $2)
          RETURNING id"
    values = [@note_tag, @bake_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

# => Delete Note by id
  def delete()
    sql = " DELETE FROM notes WHERE id = $1"
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

# =>  Find all Notes - returning all Notes
  def self.find_all()
    sql = " SELECT * FROM notes"
    result = SqlRunner.run(sql)
    notes = result.map { |note| Note.new(note) }
    return notes
  end

# => Find Note by ID - returning one Note
  def self.find_by_id(id)
    sql = "SELECT * FROM bakes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Note.new(result.first)
  end

# =>  Delete all Notes from db
  def self.delete_all()
    sql= "DELETE FROM notes"
    SqlRunner.run(sql)
  end


end
