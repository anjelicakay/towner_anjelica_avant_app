class Api::CreditCardsController < ApplicationController

  def index
    @credit_cards = CreditCard.all
    render 'index.json.jbuilder'
  end

  def create
    @credit_card = CreditCard.new(
                                  credit_limit: params[:credit_limit],
                                  apr: params[:apr],
                                  card_number: params[:card_number],
                                  expiration_date: params[:expiration_date],
                                  cvv: params[:cvv],
                                  balance: params[:balance],
                                  user_id: params[:user_id]
                                  )

    if @credit_card.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @credit_card.errors.full_messages}, status: :unprocessable_entity
    end   
  end

  def show
    @credit_card = CreditCard.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @credit_card = CreditCard.find(parms[:id])

    @credit_card.credit_limit = params[:credit_limit] || @credit_card.credit_limit
    @credit_card.apr = params[:apr] || @credit_card.apr
    @credit_card.card_number = params[:card_number] || @credit_card.card_number
    @credit_card.expiration_date = params[:expiration_date] || @credit_card.expiration_date
    @credit_card.cvv = params[:cvv] || @credit_card.cvv
    @credit_card.balance = params[:balance] || @credit_card.balance

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
