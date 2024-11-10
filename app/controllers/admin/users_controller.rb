class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
