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
    raise params[:username].inspect
    #@user = User.new(username: params["username"], password: params["password"])
    #@user.save
    session[:username] = params[:username]
    #session[:user_id] = @user.id
    #(1) use `is_logged_in?` to display username & balance (if user logged-in)
    #ELSE: link to the homepage
    #(2) use current_user to show username and balance
    redirect 'account'
  end

  get '/account' do
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
