class Admin::ProductModelsController < Admin::AdminController
  before_action :find_id, only: [:destroy, :update]
  def create
    @product_model = ProductModel.new(product_model_params)
    @product_model.save
  end
  def update
    if @product_model.update(product_model_params)
      redirect_to new_admin_boiler_path
    end
  end
  def destroy
    @product_model.destroy
    redirect_to new_admin_boiler_path
  end

  private
  def product_model_params
    params.require(:product_model).permit(:name, :boiler_id)
  end
  def find_id
    @product_model = ProductModel.find(params[:id])
  end
end
