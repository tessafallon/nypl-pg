require 'bundler'

Bundler.require

configure do
 @DB = Sequel.connect(ENV['DATABASE_URL'])
  end

class App < Sinatra::Application


  get '/' do
    erb :index
  end
end