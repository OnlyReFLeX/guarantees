class Admin::WarrantiesController < Admin::AdminController
  before_action :find_id, only: [:update, :edit, :destroy]
  def new
    @warranty = current_user.warranties.build
  end

  def create
    @warranty = current_user.warranties.build(warranty_params)
    if @warranty.save
      redirect_to warranties_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @warranty.update(warranty_params)
      redirect_to warranties_path
    else
      render :edit
    end
  end

  def destroy
    @warranty.destroy
    redirect_to warranties_path
  end

  def fields_autocomplete
    @warranty = Warranty.find_by('serial ILIKE ?', params[:serial])
    render json: @warranty
  end

  private

  def find_id
    @warranty = Warranty.find(params[:id])
  end

  def warranty_params
    params.require(:warranty).permit(:product_model_id, :name, :phone, :adress, :serial, :datefirststart, :master_id,
                                     :datebuyed, :started, :comment, :warranty_until)
  end
end
