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
    if @current_user = User.find_by(username: params["username"])
      session[:user_id] = @user.id
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    if is_logged_in?(session)
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
