class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    authorize User
    @users = @current_user.admin ? User.all : [@current_user]
    render json: @users
  end

  # GET /users/:id
  def show
    authorize @user
    render json: @user
  end

  # POST /users
  def create
    authorize User
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: 'Unable to creat user.' }, status: :unprocessable_entity
    end
  end

  # PUT /users/:id
  def update
    authorize @user
    if @user.update(user_params)
      render json: { message: 'User successfully update.' }
    else
      render json: { error: 'Unable to update user.' }, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    authorize @user
    if @user.destroy
      render json: { message: 'User successfully deleted.' }
    else
      render json: { error: 'Unable to delete user.' }, status: :bad_request
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
