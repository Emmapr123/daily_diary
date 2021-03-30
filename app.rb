require 'sinatra/base'
require './lib/diaries'

class DailyDiary < Sinatra::Base

  get '/' do
    redirect '/diary_entries'
  end

  get '/diary_entries' do
    @entries = Diaries.all
    erb :diary_entries
  end 

  get '/add_entry' do
    erb :add_entry
  end 

  post '/add_entry' do 
    @new_input = Diaries.create(name: params[:title], input: params[:input])
    redirect '/new_entry'
  end

  get '/new_entry' do 
    @show_input = Diaries.all
    erb :new_input
  end 

  get '/view_entry' do
    
  end

  run! if app_file == $0
end