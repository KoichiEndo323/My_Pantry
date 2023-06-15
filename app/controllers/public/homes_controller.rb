class Public::HomesController < ApplicationController

  def top
    @foods = Food.page(params[:page])
    @food = Food.new
  end

  def about
  end
end
