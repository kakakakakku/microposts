class LikesController < ApplicationController

  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    @like = current_user.likes.build(micropost_id: micropost.id)
      if @like.save
        flash[:success] = 'お気に入りに登録しました'
        redirect_to root_path 
      else
        flash[:danger] = 'お気に入り登録ができませんでした'
        redirect_to root_path 
      end
  end
	   
  def destroy
    @like = current_user.likes.find_by(micropost_id: params[:micropost_id])
    @like.destroy
    flash[:success] = 'お気に入りを解除しました'
    redirect_to root_path
  end

end