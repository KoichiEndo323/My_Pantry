class Public::EndUsersController < ApplicationController

  def show
    @end_user = End_user.find(params[:id])
    @articles = @end_user.articles.page(params[:page])
  end

  def edit
    @end_user = End_user.find(params[:id])
  end

  def update
    @end_user = End_user.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user.id)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :profile_image)
  end
end
