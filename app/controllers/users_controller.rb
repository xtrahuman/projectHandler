class UsersController < ApplicationController
  def index
    users = User.all
    render json: { users: }
  end

  def show
    user = User.find(params[:id])
    render json: { user: }
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: 'User created successfully.'.to_json, status: :created
    else
      render json: 'User could not be created!'.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params.require(:id))
    if user.destroy
      render json: 'user deleted successfully'.to_json, status: :ok
    else
      render json: 'Error deleting user'.to_json, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :name, :role, :bio)
  end
end
