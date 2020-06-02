require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/bake.rb')
require_relative('../models/note.rb')
also_reload('../models/*')

# =>  Find all notes
get '/notes' do
  @notes = Note.find_all()
  erb(:"notes/index")
end

# => new note
get '/notes/new' do
  erb(:"notes/new")
end

# =>  Find note by bake id
get '/note/:id' do
  @note = Note.find(params[:id])
  erb(:"notes/show")
end

# =>  Post a new note to the db
post '/notes' do
  @note = Note.new(params)
  @note.save()
  erb(:"notes/create")
end

# =>  Edit this note
get '/notes/edit/:id' do
  @note = Note.find_by_id(params[:id])
  erb(:"notes/edit")
end

# # => Delete this note from the list of notes
post '/notes/delete/:id' do
   @note = Note.find_by_id(params[:id])
   @note.delete
  erb(:"notes/delete")
end
#
# =>  Send the new edited note to the db
post '/notes/:id' do
    @note = Note.new(params)
    @note.update
    redirect "/notes/#{params[:id]}"
end
