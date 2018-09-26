require 'sinatra'

Choices = {
  'HAM' => 'Hamburger',
  'PIZ' => 'Pizza',
  'CUR' => 'Curry',
  'NOO' => 'Noodles',
}

get '/' do
  erb :original_vote
end

post '/cast' do
  @title = 'Thanks for casting your vote!'
  @vote  = params['vote']
  erb :cast
end

get '/results' do
  @votes = { 'HAM' => 7, 'PIZ' => 5, 'CUR' => 3 }
  @messages = {'HAM' => 'wenak bosss', 'PIZ' => 'kekinian anet', 'CUR' => 'yek jemek', 'NOO' => 'banyak micin'}
  erb :original_results
end