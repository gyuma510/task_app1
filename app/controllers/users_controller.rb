class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title,:start_at,:end_at,:all_day,:memo))
    if @user.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :users
    else
      flash.now[:failer] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title,:start_at,:end_at,:all_day,:memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash.now[:failer] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:delete] = "スケジュールを削除しました"
    redirect_to :users
  end
end
