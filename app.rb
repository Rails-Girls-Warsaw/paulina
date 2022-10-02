require "sinatra"
require "yaml/store"

Choices = {
    "pizza" => "Pizza",
    "pierogi" => "Pierogi",
    "barszcz" => "Barszcz",
    "nalesnik" => "Nalesnik"
    }

get '/' do
    @title = "Co tam sobie dzisiaj zjemy?"
    erb :index
end

post '/cast' do 
    @title = "Wybrałeś/aś"
    @choice = Choices[params["vote"]]
    @vote = params["vote"]

    @store = YAML::Store.new 'votes.yml'

    @store.transaction do
        @store['votes'] ||= {}
        @store['votes'][@vote] ||= 0
        @store['votes'][@vote] += 1
    end
    erb :cast
end

get '/results' do
    @title = "Nasze wyniczki!"
    @store = YAML::Store.new 'votes.yml'

   @votes = @store.transaction do
        @store['votes'] ||= {}
        @store['votes']
    end
    
    puts @votes

    erb :results
end

