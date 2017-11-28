class Admin::WarrantiesController < Admin::AdminController
  before_action :find_id, only: [:update, :edit]
  def new
    @warranty = Warranty.new
  end

  def create
    @warranty = Warranty.new(warranty_params)
    @warranty.who_created = current_user.username
    if @warranty.valid?
      @warranty.save
      redirect_to warranties_path
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @warranty.update(warranty_params)
      redirect_to warranties_path
    else
      render action: 'edit'
    end

  end

  def destroy
  end

  private
  def find_id
    @warranty = Warranty.find(params[:id])
  end
  def warranty_params
    params.require(:warranty).permit(:name, :boiler, :phone, :adress, :datebuyed, :datefirststart, :whodidfirststart, :serial, :model, :started, :search, :page, :sort, :utf8, :direction, :allfields)
  end
end
