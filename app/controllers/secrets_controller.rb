class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @user = User.find(session[:user_id])
    @all_secrets = Secret.all
    render 'index'
  end

  def create
    @user = User.find(session[:user_id])
    @secret = Secret.create(secret_params)
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @aSecret = Secret.find(params[:id])
    @theSec = Secret.find(params[:id]).user_id
    # if @aSecret.user_id == session[:user_id]
    #   @aSecret.destroy
    #   redirect_to :back
    # else
    #   flash[:notice] = "Cannot delete someone else's secret!"
    #   redirect_to :back
    # end
    @aSecret.destroy if @aSecret.user == current_user
    redirect_to :back
  end
  private
    def secret_params
      params.require(:secret).permit(:content, :user_id)
    end
end
