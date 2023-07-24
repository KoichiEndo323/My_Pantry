class Public::FoodsController < ApplicationController
before_action :authenticate_end_user!
before_action :set_food , only: %i[increase decrease]

  def index
    @q = Food.where(end_user_id: current_end_user.id).ransack(params[:q])
    @foods = @q.result(distinct: true)
    @storages = Storage.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    storage_name = params[:food][:storage_name]
    storage = Storage.find_by(name: storage_name)
    @food.end_user_id = current_end_user.id
    if @food.save
      redirect_to foods_path, notice: '食材が登録されました。'
    else
      render :new
    end
  end

  def show
    @food = Food.find(params[:id])
    @food_url = image_url(@food)
    storage = @food.storage.name
  end

  def edit
    @food = Food.find(params[:id])
    storage = @food.storage.name
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

  def increase
    @food.increment!(:quantity, 1)
    @foods = current_end_user.foods
    respond_to do |format|
      format.js
    end
  end

  def decrease
    @foods = current_end_user.foods
    decrease_or_destroy(@food)
    respond_to do |format|
      format.js
    end
  end


  private

  def food_params
    params.require(:food).permit(:image, :name, :quantity, :start_date, :end_date,:storage_id, :memo, :price)
  end

  def set_food
    @food = current_end_user.foods.find(params[:id])
  end

  def decrease_or_destroy(food)
    if food.quantity > 1
      food.decrement!(:quantity, 1)
    else
      food.destroy
    end
  end



end