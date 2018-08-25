class PagesController < ApplicationController
  	before_action :set_page, only: [:show, :edit, :update, :destroy]

	def new
		if logged_in?
			@page = Page.new
			@billing_intervals = Page::BILLING_INTERVALS
		else
      		redirect_to login_url
    	end
	end

	# POST /pages
  	# POST /pages.json
	def create
		@page = Page.new(page_params)
		@page.receiver = current_receiver

		respond_to do |format|
		    if @page.save!
		    	log_in @page
		        format.html { redirect_to @page, notice: 'Page was successfully created.' }
		        format.json { render :show, status: :created, location: @page }
		    else
		        format.html { render :new }
		        format.json { render json: @page.errors, status: :unprocessable_entity }
		    end
		end
	end

	# GET /pages/1/edit
  	def edit
  		if logged_in?
			@billing_intervals = Page::BILLING_INTERVALS
		else
      		redirect_to login_url
    	end
  	end

  	# PATCH/PUT /pages/1
  	# PATCH/PUT /pages/1.json
	def update
	    respond_to do |format|
	      if @page.update(page_params)
	        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
	        format.json { render :show, status: :ok, location: @page }
	      else
	        format.html { render :edit }
	        format.json { render json: @page.errors, status: :unprocessable_entity }
	      end
	    end
	end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :receiver_id, :recurring, :card, :ach, :default_amount, :custom_amount)
    end
end
