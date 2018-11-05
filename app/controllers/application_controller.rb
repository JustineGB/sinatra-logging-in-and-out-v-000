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
    binding.pry
    #user would have already been created so this is not a new user (not a 'registration' like the previous lab, just a log in...use find+by to find the user as their identity name/pass are already set up)
    #@user = User.new(username: params["username"], password: params["password"])
    #@user.save
    #session[:username] = params[:username]
    login(params[:username])
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
