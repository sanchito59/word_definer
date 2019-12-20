require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
    @words = Word.sort
    erb(:words)
end

get('/word/new') do
    erb(:new_word)
end

get('/words/:id') do
    @word = Word.find(params[:id].to_i())
    erb(:word)
end

post('/words') do
    values = *params.values
    word = Word.new(values[0], nil)
    word.save()
    @words = Word.sort()
    erb(:words)
end

get('/words/:id/edit') do
    @word = Word.find(params[:id].to_i())
    erb(:edit_word)
end

patch('/words/:id') do
    @word = Word.find(params[:id].to_i())
    values = *params.values
    @word.update(values[0])
    @words = Word.sort()
    erb(:words)
end

