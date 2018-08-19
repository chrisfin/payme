module SessionsHelper
	# Logs in the given user.
  def log_in(receiver)
    session[:receiver_id] = receiver.id
  end

   # Returns the current logged-in receiver (if any).
   def current_receiver
    @current_receiver ||= Receiver.find_by(id: session[:receiver_id])
  end

  # Returns true if the receiver is logged in, false otherwise.
  def logged_in?
    !current_receiver.nil?
  end

    # Logs out the current user.
  def log_out
    session.delete(:receiver_id)
    @current_receiver = nil
  end
end
