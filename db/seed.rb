require('pry')
require_relative('../models/bake.rb')
# require_relative('../models/note')

# =>  clear the db of all records of Bake, notes & images
Bake.delete_all()
# House.delete_all()

bake1 = Bake.new({
  'bake_date' => 'Friday',
  'score' => '7',
  'starter_time' => '12:30',
  'leaven_time' => '12:31',
  'autolyse_time' => '12:32',
  'add_salt_time' => '12:33',
  'bulk_time' => '12:34',
  'shape_time' => '12:35',
  'prove_time' => '12:36',
  'bake_time' => '12:37',
  'cool_time' => '12:38'
  })

  bake2 = Bake.new({
    'bake_date' => 'Saturday',
    'score' => '7',
    'starter_time' => '13:30',
    'leaven_time' => '13:31',
    'autolyse_time' => '13:32',
    'add_salt_time' => '13:33',
    'bulk_time' => '13:34',
    'shape_time' => '13:35',
    'prove_time' => '13:36',
    'bake_time' => '13:37',
    'cool_time' => '13:38'
    })

  bake3 = Bake.new({
    'bake_date' => 'Sunday',
    'score' => '8',
    'starter_time' => '14:30',
    'leaven_time' => '1431',
    'autolyse_time' => '14:32',
    'add_salt_time' => '14:33',
    'bulk_time' => '14:34',
    'shape_time' => '14:35',
    'prove_time' => '14:36',
    'bake_time' => '14:37',
    'cool_time' => '14:38'
    })

bake1.save()
bake2.save()
bake3.save()
# note1 = Note.new({
#   # 'first_name'=> 'Harry',
#   # 'last_name' => 'Potter',
#   # 'house_id' => house1.id,
#   # 'age' => 12
#   })
#
#
# note1.save()

binding.pry
nil
