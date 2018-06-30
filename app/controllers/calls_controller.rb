class CallsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        scope = Call.all
        render json: ApplicationDatatable.new(view_context, scope.includes(:product_model, :master))
      end
    end
  end

  def show
    @called = Call.find(params[:id])
  end
end
