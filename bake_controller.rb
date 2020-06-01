require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/bake.rb')
require_relative('./models/note.rb')
also_reload('./models/*')


# => bake/splash - not working yet
get '/' do
  erb(:splash)
end

# =>  Find all bakes - working
get '/bake' do
  @bakes = Bake.find_all()
  erb(:index)
end

# => bake/new bake - working
get '/bake/new' do
  erb(:new)
end

# =>  Find bake by id  - working
get '/bake/:id' do
  @bake = Bake.find(params[:id])
  erb(:show)
end

# =>  Post a new record of a bake to the db - working
post '/bake' do
  @bake = Bake.new(params)
  @bake.save()
  erb(:create)
end

# =>  Edit this bake
get '/bake/edit/:id' do
  @bake = Bake.find(params[:id])
  erb(:edit)
end

# => bake/how to guide

# => Delete this bake from the list of bakes - working
post '/bake/delete/:id' do
   @bake = Bake.find(params[:id])
   @bake.delete
  erb(:delete)
end

# =>  Edit this bake
get '/bake/edit/:id' do
  @bake = Bake.find(params[:id])
  erb(:edit)
end

# =>  Send the new edited bake to the db
post '/bake/:id' do
    @bake = Bake.new(params)
    @bake.update
    redirect "/bake/#{params[:id]}"
end

# => bake/bake_id

# => bake/bake_id/note

# => bake/id/image_id
#
# get '/bake/new' do
#   erb(:new)
# end
#
