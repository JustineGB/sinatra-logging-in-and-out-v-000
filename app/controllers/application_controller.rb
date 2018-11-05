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

  post '/login' do 
    #user would have already been created so this is not a new user (not a 'registration' like the previous lab, just a log in...use find+by to find the user as their identity name/pass are already set up)
    #@user = User.new(username: params["username"], password: params["password"])
    #@user.save
    #session[:username] = params[:username]
    @user = User.find_by(email: params["email"], password: params["password"])
    session[:user_id] = @user.id
    #(1) use `is_logged_in?` to display username & balance (if user logged-in)
    #ELSE: link to the homepage
    #(2) use current_user to show username and balance
    redirect '/account'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get 'account' do
    @user = User.find(session[:user_id])
    erb :'account'
  end
  
end
