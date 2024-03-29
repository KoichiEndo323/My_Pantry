class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(current_end_user.id)
    @articles = @end_user.articles.page(params[:page]).per(5)
    @favorites_articles = @end_user.favorites.page(params[:page]).per(5)
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end

  def update
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(end_user_params)
    redirect_to mypage_end_users_path(current_end_user)
    flash[:notice] = "変更が完了しました"
  end

  def check
  end

  def withdraw
    @end_user = EndUser.find(current_end_user.id)
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :profile_image)
  end

end
