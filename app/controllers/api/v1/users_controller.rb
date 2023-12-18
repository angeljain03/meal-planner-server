class Api::V1::UsersController < ApplicationController
  before_action :getUser , only: [:updateUser , :deleteUser , :show]
    # get
  def getUsers
    user = User.all
    if user
      render json: user , status: :ok
    else
      render json: {msg: "user Empty"} , status: :unprocessable_entity
    end
  end

  # post
  def addUser
    user = User.new(user_params)

    if user.save
      render json: user, status: :ok
    else
      render json: {msg: "user not added" , error: user.errors} ,status: :unprocessable_entity
    end
  end

  # show
  def show
    if @user
      render json: @user , status: :ok
    else
      render json: {msg: "user not found"} , status: :unprocessable_entity
    end
  end
  # put
  def updateUser
    if @user
      if @user.update(user_params)
        render json: @user , status: :ok
      else
        render json: {msg: "user not updated" , error:@user.errors} , status: :unprocessable_entity
      end
    else
      render json: {msg: "user not found"} , status: :unprocessable_entity
    end

  end

  # delete
  def deleteUser
    if @user
      if @user.destroy
        render json: {msg: "user deleted"} , status: :ok
      else
        render json: {msg: "user cannot be deleted"} , status: :unprocessable_entity
      end
    else
      render json: {msg: "user not found"} , status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.permit(:username , :email , :password)
    end

    def getUser
      @user = User.find(params[:id])
    end
end
