class Public::MenusController < ApplicationController

  def index
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.end_user_id = current_end_user.id
    if @menu.save
      redirect_to menus_path, notice: '食事内容が記録されました。'
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
   private

  def menu_params
    params.require(:menu).permit(:image, :name, :quantity, :start_date, :end_date,:storage_id, :memo)
  end
  
end
