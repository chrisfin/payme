class SessionsController < ApplicationController

  def new
  end

  def create
    receiver = Receiver.find_by(email: params[:session][:email].downcase)
    if receiver && receiver.authenticate(params[:session][:password])
      log_in receiver
      redirect_to receiver
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end
end