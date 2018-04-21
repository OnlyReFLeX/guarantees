class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'У вас недостаточно прав.' unless current_user.admin?
  end
end
