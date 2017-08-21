class Admin::ModelsController < Admin::AdminController

  def new
    @models = Model.all
    @model = Model.new
  end

  def create
    @models = Model.all
    @model = Model.new(call_params)

    if @model.valid?
      @model.save
      redirect_to new_admin_model_path
    else
      render action: 'new'
    end
  end

  def destroy
    Model.find(params[:id]).destroy
    redirect_to :action => 'new'
  end


  private
  def call_params
    params.require(:model).permit(:kotel)
  end
end
