# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, if: :devise_controller?
  before_action :reject_end_user, only: [:create]


  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
  end

    def reject_end_user
      @end_user = EndUser.find_by(email: params[:end_user][:email])                               #入力されたemailからアカウントを1件取得
      return if !@end_user                                                                      #アカウントを取得できなかった場合、このメソッドを終了する
        if @end_user.valid_password?(params[:end_user][:password]) && @end_user.is_deleted == true  #取得したアカウントのパスワードと入力されたパスワードが一致しているかつ(&&)、is_deletedがtrueだった場合
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"                           #trueだった場合、サインアップ画面に遷移する処理を実行する
          redirect_to new_end_user_registration_path
        else
          flash[:notice] = "項目を入力してください"
        end                                                                                         #falseだった場合、createアクションを実行させる
    end

end
