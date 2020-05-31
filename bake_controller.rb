require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/bake.rb')
require_relative('./models/note.rb')
also_reload('./models')

# => bake/home page

get '/bake' do
  @bakes = Bake.find_all()
  erb(:index)
end

# => bake/new bake
get '/bake/new' do
  erb(:new)
end

get '/bake/:id'do
  @bakes = Bake.find(params[:id])
  erb(:show)
end

post '/bake' do
  @bake = Bake.new(params)
  @bake.save()
  erb(:create)
end

# => bake/how to guide

# => bake/all bakes
# get '/bake/all bakes' do
#   @bakes = Bake.find_all
#   erb(:show)
# end



# => bake/bake_id

# => bake/bake_id/note

# => bake/id/image_id
#
# get '/bake/new' do
#   erb(:new)
# end
#
