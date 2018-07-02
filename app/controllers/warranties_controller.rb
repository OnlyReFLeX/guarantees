class WarrantiesController < ApplicationController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def index
    respond_to do |format|
      format.html
      format.json do
        scope = Warranty.all
        render json: ApplicationDatatable.new(view_context, scope.includes(:product_model, :master))
      end
    end
  end

  def show
    @warranty = Warranty.find(params[:id])
    @calls = @warranty.calls.paginate(page: params[:page], per_page: 15)
  end
end
