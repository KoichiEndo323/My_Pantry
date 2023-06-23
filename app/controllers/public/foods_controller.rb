class Public::FoodsController < ApplicationController



  def index
    @foods = Food.page(params[:page])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.end_user_id = current_end_user.id
    if @food.save
      redirect_to foods_path, notice: '食材が登録されました。'
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to foods_path, notice: '食材情報が変更されました。'
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: '食材を削除しました。'
  end

  private

  def food_params
    params.require(:food).permit(:image, :name, :quantity, :start_date, :end_date)
  end
end

