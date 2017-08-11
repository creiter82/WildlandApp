class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:name)
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)

      flash[:success] = "#{@user.name.titleize} was updated successfully"

      redirect_to users_path

    else

      render 'edit'

    end
  end

  def show
  end

  def destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
       params.require(:user).permit(:name, :email, :phone, :shift, certification_ids:[]) 
    end
end
