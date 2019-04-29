class Api::PaymentsController < ApplicationController
  before_action :authenticate_user

  def index
    @payments = Payment.all 
    render 'index.json.jbuilder'
  end

  def create
    @payment = Payment.new(
                            amount: params[:amount],
                            date: params[:date],
                            credit_card_id: params[:credit_card_id],
                            status: "pending"
                          )

    if @payment.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @payment.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def show
    @payment = Payment.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @payment = Payment.find(params[:id])

    @payment.amount = params[:amount] || @payment.amount
    @payment.date = params[:date] || @payment.date
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    render json: {message: "Successfully removed payment."}
  end
end
