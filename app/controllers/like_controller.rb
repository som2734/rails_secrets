class LikeController < ApplicationController
  def create
    @like = Like.create(user_id: session[:user_id], secret_id: params[:id])
    session[:secret_id] = Secret.find(params[:id])
    @like_count = Like.where(secret_id: params[:id]).all.count(:id)
    puts @like_count
    redirect_to '/secrets'
  end

  def destroy
    @like = Like.where(secret_id: params[:id]).last
    @unlike = @like.destroy
    redirect_to :back
  end

end
