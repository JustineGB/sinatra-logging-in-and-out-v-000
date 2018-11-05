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
    if @user = User.find_by(username: params["username"])
      session[:user_id] = @user.id
      erb :account
    else
      redirect '/error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/account' do
    if @user.is_logged_in?
      erb :account
    else
    redirect '/error'
    end
  end 

end
