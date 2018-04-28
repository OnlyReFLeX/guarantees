class Admin::ProductModelsController < Admin::AdminController
  before_action :find_id, only: [:destroy, :update]

  def create
    @boiler = Boiler.find(params[:boiler_id])
    @product_model = @boiler.product_models.build(product_model_params)
    @product_model.save
  end

  def update
    @product_model.update(product_model_params)
  end

  def destroy
    @product_model.destroy
  end

  private

  def product_model_params
    params.require(:product_model).permit(:name, :boiler_id)
  end

  def find_id
    @product_model = ProductModel.find(params[:id])
  end
end
