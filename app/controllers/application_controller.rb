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
    
    @user = User.find_by(username: params["username"], password: params["password"])
    session[:user_id] = @user.id
      if @user.is_logged_in?
        redirect '/account'
      else
        redirect '/'
      end
    end

  get '/logout' do
    session.clear
    redirect '/'
  end

  #get 'account' do
  #  @user = User.find(session[:user_id])
  #  erb :'account'
  #end

end
