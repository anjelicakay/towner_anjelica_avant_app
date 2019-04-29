class Api::ChargesController < ApplicationController
  before_action :authenticate_user
  
  def index
    @charges = Charge.all 
    render 'index.json.jbuilder'
  end

  def create
    @charge = Charge.new(
                          date: params[:date],
                          vendor: params[:vendor],
                          amount: params[:amount],
                          credit_card_id: params[:credit_card_id]
                        )

    if @charge.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @charge.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def show
    @charge = Charge.find(params[:id])
    render 'show.json.jbuilder'
  end
  
end
