require "sinatra"

Choices = {
    "pizza" => "Pizza",
    "pierogi" => "Pierogi",
    "barszcz" => "Barszcz"
    }
    
get '/' do
    @title = "Co tam sobie dzisiaj zjemy?"
   erb :index
   end
