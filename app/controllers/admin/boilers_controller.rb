class Admin::BoilersController < Admin::AdminController

  def new
    @boilers = Boiler.all
    @boiler = Boiler.new
  end

  def create
    @boilers = Boiler.all
    @boiler = Boiler.new(call_params)

    if @boiler.valid?
      @boiler.save
      redirect_to new_admin_boiler_path
    else
      render action: 'new'
    end
  end

  def destroy
    Boiler.find(params[:id]).destroy
    redirect_to :action => 'new'
  end


  private
  def call_params
    params.require(:boiler).permit(:name)
  end
end
