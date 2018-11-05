require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end




  post ;/login/
      #@user = User.new(username: params["username"], password: params["password"])
      #@user.save
      #session[:username] = params[:username]
      #session[:user_id] = @user.id
      #(1) use `is_logged_in?` to display username & balance (if user logged-in)
      #ELSE: link to the homepage
      #(2) use current_user to show username and balance




  post '/login' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:id] = @user.id
    redirect '/account'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  #get 'account' do
    #@user = User.find(session[:user_id])
    #erb :'account'
  #end
  
end
