require 'pry'

class Helpers < ApplicationController

  def login(username)
    session[:username] = username 
  end

  def is_logged_in?
  #  if session[:usernam].empty?
  #    redirect "/index"
    !!session[:user_id]
  end

  def current_user(session)
    session[:user_id] == @user.id
  end

  def logout
    session.clear
  end

end
