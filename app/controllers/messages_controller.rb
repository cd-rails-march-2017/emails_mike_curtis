class MessagesController < ApplicationController
  def index
    if !session[:user_id]
      redirect_to "/sessions"
    end
    @user = User.find(session[:user_id])
    @messages = @user.user_senders
  end

  def outbox
    @user = User.find(session[:user_id])
    @messages = @user.user_recipients
  end

  def new
    if !session[:user_id]
      redirect_to "/sessions"
    end
    @all_users = User.all
  end

  def create
    message = Message.new(content: params[:message])
    message.save
    sender = User.find(session[:user_id])
    recipient = User.find(params[:recipient])
    Contact.create(sender: sender, recipient: recipient, message: message)
    redirect_to "/messages/outbox"
  end

  def show
    if !session[:user_id]
      redirect_to "/sessions"
    end
  end
end
