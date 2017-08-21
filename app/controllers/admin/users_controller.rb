class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all.order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if User.where(admin: true).size == 1 and user_params[:admin] == "0"
      redirect_to admin_users_path, alert: 'Вы последний администратор.'
    else
      @user.update(user_params)
      redirect_to admin_users_path
    end
  end

  def destroy
    user = User.find(params[:id])
    if User.all.size == 1
      redirect_to admin_users_path, alert: 'Последний пользователь не может быть удален.'
    elsif User.where(admin: true).size == 1 and user.admin? == true
      redirect_to admin_users_path, alert: 'Последний администратор не может быть удален.'
    else
      user.destroy
      redirect_to admin_users_path, notice: 'Пользователь успешно удален.'
    end
  end

  private
  def user_params
    params.require(:user).permit(:admin)
  end

end
