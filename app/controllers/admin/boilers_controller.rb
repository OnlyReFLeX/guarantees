class Admin::BoilersController < Admin::AdminController
  before_action :find_id, only: [:destroy, :edit, :update]
  before_action :boilers_all, only: [:new, :create]
  def new
    @boiler = Boiler.new
    @product_model = ProductModel.new
  end

  def create
    @boiler = Boiler.new(boiler_params)

    if @boiler.save
      redirect_to new_admin_boiler_path
    else
      render action: 'new'
    end
  end

  def update
    if @boiler.update(boiler_params)
      redirect_to new_admin_boiler_path
    end
  end

  def destroy
    @boiler.destroy
    redirect_to action: 'new'
  end

  private
  def find_id
    @boiler = Boiler.find(params[:id])
  end
  def boilers_all
    @boilers = Boiler.order('name').paginate(:per_page => 10, :page => params[:page])
  end
  def boiler_params
    params.require(:boiler).permit(:name)
  end
end
