class MessagesController < ApplicationController
  def index
    if !session[:user_id]
      redirect_to "/sessions"
    end
    @user = User.find(session[:user_id])
    @message = @user.sent_by
  end

  def outbox
  end

  def new
    if !session[:user_id]
      redirect_to "/sessions"
    end
    @all_users = User.all
  end

  def create

  end

  def show
    if !session[:user_id]
      redirect_to "/sessions"
    end
  end
end
