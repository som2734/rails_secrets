class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update]
  def new
  end

  def show
    @user = User.find(params[:id])
    @my_s = Secret.joins(:user).where(user_id: @user.id).all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/sessions/new"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end
  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    @edited_user = User.update(params[:id], user_params)
    redirect_to "/users/#{@user.id}/edit"
  end

  def profile
    @user = User.find(params[:id])
    render 'profile'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
