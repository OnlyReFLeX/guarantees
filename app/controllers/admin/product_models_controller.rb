class ProductModelsController < Admin::AdminController
  def create
    @product_model = ProductModel.new(product_models_params)
    if @product_model.save
      redirect_to new_admin_boiler_path
    else
      render action: 'new'
    end
  end

  private
  def product_models_params
    params.require(:product_model).permit(:name)
  end
end
