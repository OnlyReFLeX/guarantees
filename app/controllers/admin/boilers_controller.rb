class Admin::BoilersController < Admin::AdminController
  before_action :find_id, only: [:destroy, :edit, :update]
  before_action :boilers_all, only: [:new, :create]
  def new
    @boiler = Boiler.new
  end

  def create
    @boiler = Boiler.new(call_params)

    if @boiler.save
      redirect_to new_admin_boiler_path
    else
      render action: 'new'
    end
  end

  def destroy
    @boiler.destroy
    redirect_to :action => 'new'
  end


  private
  def find_id
    @boiler = Boiler.find(params[:id])
  end
  def boilers_all
    @boilers = Boiler.all
  end
  def call_params
    params.require(:boiler).permit(:name)
  end
end
