require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
    erb(:words)
end

get('/word/new') do
    erb(:new_word)
end