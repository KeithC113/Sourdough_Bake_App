require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/bake.rb')
require_relative('../models/note.rb')
also_reload('../models/*')

# =>  Find all bakes - working
get '/bake' do
  @bakes = Bake.find_all()
  erb(:"bakes/index")
end

# => bake/new bake - working
get '/bake/new' do
  erb(:"bakes/new")
end

# =>  Find bake by id  - working
get '/bake/:id' do
  @bake = Bake.find(params[:id])
  @notes = @bake.notes
  erb(:"bakes/show")
end

# =>  Post a new record of a bake to the db - working
post '/bake' do
  @bake = Bake.new(params)
  @bake.save()
  erb(:"bakes/create")
end

# =>  Edit this bake
get '/bake/edit/:id' do
  @bake = Bake.find(params[:id])
  erb(:"bakes/edit")
end

# => Delete this bake from the list of bakes - working
post '/bake/delete/:id' do
   @bake = Bake.find(params[:id])
   @bake.delete
  erb(:"bakes/delete")
end

# =>  Edit this bake
get '/bake/edit/:id' do
  @bake = Bake.find(params[:id])
  erb(:"bakes/edit")
end

# =>  Send the new edited bake to the db
post '/bake/:id' do
    @bake = Bake.new(params)
    @bake.update
    redirect "/bake/#{params[:id]}"
end
