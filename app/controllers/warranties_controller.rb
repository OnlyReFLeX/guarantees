class WarrantiesController < ApplicationController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def index
    @warranties = Warranty.order(sort_column + ' ' + sort_direction)
                          .paginate(per_page: 10, page: params[:page])
  end

  def show
    @warranty = Warranty.find(params[:id])
    @calls = @warranty.calls.paginate(page: params[:page], per_page: 10)
  end

  private

  def sort_column
    Warranty.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
  end
end
