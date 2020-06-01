require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bake_controller')
require_relative('controllers/note_controller')

get '/' do
  erb(:index)
end
