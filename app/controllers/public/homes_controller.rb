class Public::HomesController < ApplicationController

  def top
    if end_user_signed_in?
      @q = Food.where(end_user_id: current_end_user.id).ransack(params[:q])
      @foods = @q.result.page(params[:page])
    end
  end

  def about
  end
end
