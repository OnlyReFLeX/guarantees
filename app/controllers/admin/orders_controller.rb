class Admin::OrdersController < Admin::AdminController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def new
    @models = Model.all
  end

  def create
    @call = Call.new(call_params)
    @models = Model.all

    if @call.valid?
      @call.save
      redirect_to orders_path
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
      redirect_to order_path
    else
      render action: 'edit'
    end

  end

  def destroy
    Call.find(params[:id]).destroy
    redirect_to orders_path
  end

  private
  def call_params
    params.require(:call).permit(:username, :kotel, :phone, :adress, :date, :success, :master, :error, :search, :page, :sort, :utf8, :direction, :allfields, :guarantee, :currentuser)
  end


  def sort_column
    Call.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
