class Admin::CallsController < Admin::AdminController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction
  before_action :find_id, only: [:update, :edit, :destroy]
  before_action :boilers_all, only: [:new, :create]
  def new
    @call = Call.new
  end

  def create
    @call = Call.new(call_params)
    @call.who_created = current_user.username

    if @call.save
      redirect_to calls_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @call.update(call_params)
      redirect_to call_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @call.destroy
    redirect_to calls_path
  end

  private

  def call_params
    params.require(:call).permit(:boiler, :username, :who_created, :phone, :adress, :call_date, :status, :master, :error, :guarantee, :serial_code, :whycanceled, :infosuccess, :comment)
  end
  def find_id
    @call = Call.find(params[:id])
  end
  def boilers_all
    @boilers = Boiler.all
  end

  def sort_column
    Call.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
