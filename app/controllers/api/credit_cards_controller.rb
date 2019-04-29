class Api::CreditCardsController < ApplicationController
  before_action :authenticate_user

  def index
    @credit_cards = current_user.credit_cards

    render 'index.json.jbuilder'
  end

  def create
    @credit_card = CreditCard.new( 
                                  user_id: current_user.id,
                                  credit_limit: params[:credit_limit],
                                  apr: params[:apr],
                                  expiration_date: params[:expiration_date],
                                  balance: params[:balance]
                                  )
    @credit_card.assign_card_number
    @credit_card.assign_cvv

    if @credit_card.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @credit_card.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def show
    @credit_card = CreditCard.find(params[:id])
    @credit_card.calculate_balance
    render 'show.json.jbuilder'
  end

  def update
    @credit_card = CreditCard.find(params[:id])

    @credit_card.credit_limit = params[:credit_limit] || @credit_card.credit_limit
    @credit_card.apr = params[:apr] || @credit_card.apr
    @credit_card.card_number = params[:card_number] || @credit_card.card_number
    @credit_card.expiration_date = params[:expiration_date] || @credit_card.expiration_date
    @credit_card.cvv = params[:cvv] || @credit_card.cvv
    @credit_card.calculate_balance

    if @credit_card.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @credit_card.errors.full_messages}, status: :unprocessable_entity
    end   
  end

  def destroy
    credit_card = CreditCard.find(params[:id])
    credit_card.destroy
    render json: {message: "Successfully removed credit card."}
  end
end
