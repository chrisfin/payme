class ChargesController < ApplicationController
	before_action :set_charge, only: [:show, :edit, :update, :destroy]

	def new
	end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:txn_id, :source, :amount, :app_id)
    end
end
