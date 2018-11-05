require 'pry'

class Helpers < ApplicationController

  def is_logged_in?(session)
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
