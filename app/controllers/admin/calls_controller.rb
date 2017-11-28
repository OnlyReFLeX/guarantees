class Admin::CallsController < Admin::AdminController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def new
    @call = Call.new
    @boilers = Boiler.all
  end

  def create
    @call = Call.new(call_params)
    @call.success = "no"
    @call.who_created = current_user.username
    @boilers = Boiler.all

    if @call.valid?
      @call.save
      redirect_to calls_path
    else
      render action: 'new'
    end
  end


  def edit
    @call = Call.find(params[:id])
  end

  def update
    @call = Call.find(params[:id])

    if @call.update(call_params)
      redirect_to call_path
    else
      render action: 'edit'
    end

  end

  def destroy
    Call.find(params[:id]).destroy
    redirect_to calls_path
  end

  private
  def call_params
    params.require(:call).permit(:username, :boiler, :phone, :adress, :date, :success, :master, :error, :search, :page, :sort, :utf8, :direction, :allfields, :guarantee)
  end


  def sort_column
    Call.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
