require 'bundler'

Bundler.require

class App < Sinatra::Application
  
get '/' do
  'this'
end