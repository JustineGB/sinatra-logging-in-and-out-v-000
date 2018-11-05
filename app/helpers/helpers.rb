require 'pry'

class Helpers < ApplicationController

  def current_user
  end

  def is_logged_in?
    !!session[:username]
  end

  def logout
    session.clear
  end

end
