class Admin::AdminController < ApplicationController

  before_action :check_admin

  protected
  def check_admin
    redirect_to root_path, alert: "У вас недостаточно прав !" unless current_user.admin?
  end
end
