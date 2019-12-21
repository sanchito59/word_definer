require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
    @words = Word.sort
    erb(:words)
end

get('/words') do
    if params["search"]
        @words = Word.search(params[:search])
    else
        @words = Word.sort
    end
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
    @word.update(values[1])
    @words = Word.sort()
    erb(:words)
end

delete('/words/:id') do
    @word = Word.find(params[:id].to_i())
    @word.delete()
    @words = Word.sort()
    erb(:words)
end

# Definition Routes

get('/words/:id/definitions/:word_id') do
    @word = Word.find(params[:id].to_i())
    @definition = Definition.find(params[:word_id].to_i())
    erb(:definitions)
end

post('/words/:id/definitions') do
    @word = Word.find(params[:id].to_i())
    definition = Definition.new(params[:definition], @word.id, nil)
    definition.save()
    erb(:word)
end

patch('/words/:id/definitions/:word_id')do
    @word = Word.find(params[:id].to_i())
    definition = Definition.find(params[:word_id].to_i())
    definition.update(params[:definition], @word.id)
    erb(:word)  
end

delete('/words/:id/definitions/:word_id') do
    definition = Definition.find(params[:word_id].to_i())
    definition.delete()
    @word = Word.find(params[:id].to_i())
    erb(:word)  
end