class ReceiversController < ApplicationController
	before_action :set_receiver, only: [:show, :edit, :update, :destroy]

	# GET /receivers/new
	def new
	  @receiver = Receiver.new
	end

	# GET /receivers/1
  	# GET /receivers/1.json
	def show

	end

	# POST /receivers
  	# POST /receivers.json
	def create
		@receiver = Receiver.new(receiver_params)

		respond_to do |format|
		    if @receiver.save!
		    	log_in @receiver
		        format.html { redirect_to @receiver, notice: 'Account was successfully created.' }
		        format.json { render :show, status: :created, location: @receiver }
		    else
		        format.html { render :new }
		        format.json { render json: @receiver.errors, status: :unprocessable_entity }
		    end
		end
	end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_receiver
      @receiver = Receiver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receiver_params
      params.require(:receiver).permit(:first_name, :last_name, :company_name, :email, :password, :password_confirmation, :code, :state)
    end

end
