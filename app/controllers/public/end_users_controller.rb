class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_guest_user, only: [:edit, :show]

  def show
    @end_user = EndUser.find(current_end_user.id)
    @articles = @end_user.articles.page(params[:page])
  end

  def edit
    @end_user = End_user.find(current_end_user.id)
  end

  def update
    @end_user = End_user.find(current_end_user.id)
    @end_user.update(end_user_params)
    redirect_to mypage_path
    flash[:notice] = "変更が完了しました"
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

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.nickname == "ゲストユーザー"
      flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      redirect_to user_path(current_user)
    end
  end

end
