require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "172.18.0.1",
  :username => "root",
  :password => "rootpw",
  :database => "cookbook_db"
)

class User < ActiveRecord::Base
end

#ActiveRecord::Migration.create_table :users do |t|
#  t.string :name
#end

class App < Sinatra::Application
end

get '/mysql' do
  #User.all.each do |user|
  #  puts "#{user.id}. #{user.name}"
  #end
  ## p User.all
end

get '/users/list' do
  @users = User.all
  erb :mysql
end

