require 'pry'

class Helpers < ApplicationController

  def current_user
  end

  def is_logged_in?
  #  if session[:usernam].empty?
  #    redirect "/index"
    !!session[:user_id]
  end

  def logout
    session.clear
  end

end
