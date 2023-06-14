class Public::HomesController < ApplicationController

  def top
    @foods = Food.page(params[:page])
  end

  def about
  end
end
