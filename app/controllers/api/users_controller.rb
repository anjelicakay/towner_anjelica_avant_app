class Api::UsersController < ApplicationController

  def create
    @user = User.new(
                    first_name: parmas[:first_name],
                    last_name: params[:last_name]
                    )

    if user.save
      render json: {message: "User created successfully"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
  
end
