class Admin::AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :cheack_admin

  protected
  def cheack_admin
    redirect_to root_path, alert: "У вас недостаточно прав !" unless current_user.admin?
  end
end
