class Public::HomesController < ApplicationController

  def top
    @q = Food.ransack(params[:q])
    @foods = @q.result.page(params[:page])
  end

  def about
  end
end
