class StaticPagesController < ApplicationController
	def home
	end

	def stripe
		key = Figaro.env.stripe_api_key
		stripe_auth = params[:code]
		@receiver = Receiver.find(params[:state])
		response = HTTParty.post("https://connect.stripe.com/oauth/token",
			:query => { 
				client_secret: key, 
				code: stripe_auth,
				grant_type: "authorization_code"
			}
		)

		@receiver.auth_code = stripe_auth
		@receiver.acc_id = response["stripe_user_id"]
		
		respond_to do |format|
		    if @receiver.save!
		        format.html { redirect_to @receiver, notice: 'Account was connected to Stripe.' }
		        format.json { render :show, status: :created, location: @receiver }
		    else
		        format.html { render :new }
		        format.json { render json: @receiver.errors, status: :unprocessable_entity }
		    end
		end
	end

end
