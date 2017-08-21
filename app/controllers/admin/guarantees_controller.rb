class Admin::GuaranteesController < Admin::AdminController

  def new
  end

  def create
    @warranty = Warranty.new(warranty_params)

    if @warranty.valid?
      @warranty.save
      redirect_to guarantees_path
    else
      render action: 'new'
    end
  end
  def edit
    @warranty = Warranty.find(params[:id])
  end

  def update
    @warranty = Warranty.find(params[:id])

    if @warranty.update(warranty_params)
      redirect_to guarantees_path
    else
      render action: 'edit'
    end

  end

  def destroy
  end

  private
  def warranty_params
    params.require(:warranty).permit(:name, :kotel, :phone, :adress, :datebuyed, :datefirststart, :whodidfirststart, :serial, :model, :started, :search, :page, :sort, :utf8, :direction, :allfields, :currentuser)
  end
end
