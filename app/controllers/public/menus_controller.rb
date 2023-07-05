class Public::MenusController < ApplicationController

  def index
    @menus = Menu.all

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
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menus_path, notice: '食事内容が変更されました。'
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_path, notice: '食事内容を削除しました。'
  end

   private

  def menu_params
    params.require(:menu).permit(:image, :title, :memo)
  end

end
