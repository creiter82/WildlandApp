class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_active_user, only: [:edit]

  access user: {except: [:new, :destroy]}, admin: :all

  def index
    # @users = User.order(:name)
    @users = User.by_name
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
      if admin?
        params.require(:user).permit(:name, :email, :phone, :shift, :deployments_count, :role, qualification_ids:[]) 
      else
        params.require(:user).permit(:name, :email, :phone, :shift)
      end
    end

    def check_active_user
      forbidden! unless current_user == @user || logged_in?(:admin)
    end
end
