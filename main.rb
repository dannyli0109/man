require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require 'httparty'

require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/hobby'
require_relative 'models/hobby_type'




# def run_sql(sql)
#   conn = PG.connect(dbname: 'man')
#   result = conn.exec(sql)
#   conn.close
#   result
# end

helpers do

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end

enable :sessions




get '/' do
  erb :index
end

get '/dashboard' do
  if logged_in?
    user = User.find(session[:user_id])
    @hobbies = Hobby.where(user_id: session[:user_id])
    @hobby_names = []
    @hobbies.each do |hobby|
      @hobby_names.push(HobbyType.find(hobby.id).name)
    end
    @hobby_names.uniq!
    @results = {}
    @hobby_names.each do |hobby_name|
      @results[hobby_name] = HTTParty.get("https://api.meetup.com/find/events?&sign=true&photo-host=public&fields=#{hobby_name}&key=36c7a1934185c6a585a405c166c59a").parsed_response[0..4]
    end

    binding.pry

    erb :dashboard
  else
    redirect '/'
  end
end



get '/new_user' do
  erb :new_user
end

post '/new_user' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  if user.save
    redirect '/login'
  else
    erb :new_user
  end
end

get '/login' do
  erb :login
end

get '/users/:id' do
  binding.pry
  redirect "/"
end


post '/session' do
  user = User.find_by(email:params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/dashboard"
  else
    redirect '/'
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/'
end
