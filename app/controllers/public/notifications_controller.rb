class Public::NotificationsController < ApplicationController

  def index
    @notifications = Notification.all

  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to notification_path
  end

  def destroy_all
    current_end_user.notifications.destroy_all
    redirect_to notification_path, notice: '通知を全て削除しました。'
  end



private
  def notification_params
    params.require(:notification).permit(:is_checked)
  end


end
