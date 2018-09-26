require 'sinatra'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "172.18.0.1",
  :username => "root",
  :password => "rootpw",
  :database => "cookbook_db"
)

class Food < ActiveRecord::Base
end

class App < Sinatra::Application
end

get '/' do
  erb :vote
end

after do
  ActiveRecord::Base.clear_active_connections!
end

#post '/cast' do
#  @title = 'Thanks for casting your vote!'
#  @vote  = params['vote']
#  erb :cast
#end

post '/cast' do
  # f = Food.where({ :id => @vote})
  @title = 'Thanks for casting your vote!'
  @vote  = params['vote']
  f = Food.find(@vote)
  f.vote_amount += 1
  f.save!
  @food = f
erb :cast
end

get '/results' do
  @foods = Food.all
  erb :results
end

## ADD NEW PRODUCT
get '/new' do
  erb :new
end

post '/add' do
  f = Food.new
  f.food_name = params['name']
  f.food_code = params['code']
  f.save!
  @food = f
erb :cast
end

## DELETE PRODUCT
delete '/remove/:id' do
  @id = params['id']
  f = Food.find(@id)
  @food = f
  f.destroy
erb :castdel
end

get '/resultdel' do
  @foods = Food.all
  erb :resultdel
end
