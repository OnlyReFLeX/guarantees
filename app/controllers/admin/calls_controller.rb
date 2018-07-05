class Admin::CallsController < Admin::AdminController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction
  before_action :find_id, only: [:update, :edit, :destroy, :call_expect, :call_in_progress]
  before_action :boilers_all, only: [:new, :create]

  def new
    @call = current_user.calls.build
  end

  def create
    @call = current_user.calls.build(call_params)

    if @call.save
      redirect_to calls_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @call.update(call_params)
      redirect_to call_path
    else
      render :edit
    end
  end

  def destroy
    @call.destroy
    redirect_to calls_path
  end

  def serial_autocomplete
    respond_to do |format|
      format.json do
        render json: Warranty.serials(params[:term])
      end
    end
  end

  def call_expect
    @call.update(status: 'expect')
    redirect_to @call
  end

  def call_in_progress
    @call.update(status: 'in_progress')
    redirect_to @call
  end

  private

  def call_params
    params.require(:call).permit(:product_model_id, :username, :phone, :adress, :call_date, :status, :master_id, :error,
                                 :guarantee, :serial_code, :whycanceled, :infosuccess, :comment)
  end

  def find_id
    @call = Call.find(params[:id])
  end

  def boilers_all
    @boilers = Boiler.all
  end
end
