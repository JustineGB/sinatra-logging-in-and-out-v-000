require 'pry'

class Helpers < ApplicationController

  def login(username)

  end

  def is_logged_in?
    binding.pry
  #  if session[:usernam].empty?
  #    redirect "/index"
    !!session[:user_id]
  end

  def current_user
    session[:user_id] == @user.id
  end

  def logout
    session.clear
  end

end
