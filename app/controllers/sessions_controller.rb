class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      puts "found a user!"
      session[:user_id] = user.id
      session[:name] = user.name
    else
      puts "creating a user!"
      user = User.new(name: params[:name])
      user.save
      session[:user_id] = user.id
      session[:name] = user.name
    end
    redirect_to "/"
  end
end
