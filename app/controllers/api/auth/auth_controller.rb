class Api::Auth::AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])

    # check if user exists
    if !user
      render json:{ msg: "Username doesn't exists" , user: user} , status: :unprocessable_entity
    end

    if user.authenticate(params[:password])
      render json:{ msg: 'Success Login' , user: user} , status: :ok
    else
      render json:{ msg: 'Wrong Password'} , status: :unauthorized
    end
  end
end
