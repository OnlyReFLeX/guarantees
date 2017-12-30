class Admin::ProductModelsController < Admin::AdminController
  before_action :find_id, only: :destroy
  def create
    @product_model = ProductModel.new(product_models_params)
    if @product_model.save
      redirect_to new_admin_boiler_path
    end
  end
  def destroy
    @product_model.destroy
    redirect_to new_admin_boiler_path
  end

  private
  def product_models_params
    params.require(:product_model).permit(:name, :boiler_id)
  end
  def find_id
    @product_model = ProductModel.find(params[:id])
  end
end
