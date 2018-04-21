class Admin::UsersController < Admin::AdminController
  before_action :find_user, only: [:destroy, :edit, :update]

  def index
    @users = User.order(created_at: :DESC)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: 'Администратор успешно добавлен'
    else
      render :new
    end
  end

  def destroy
    if User.where(type: 'Admin').count == 1 && @user.admin?
      redirect_to admin_users_path, alert: 'Последний администратор не может быть удален.'
    else
      @user.destroy
      redirect_to admin_users_path, notice: 'Пользователь успешно удален.'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Успешно обновлен'
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :type)
  end
end
