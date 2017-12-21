class WarrantiesController < ApplicationController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def index
    @warranties = Warranty.date_period(params[:datebuyed], 'datebuyed')
                          .date_period(params[:created_at], 'created_at')
                          .search(params[:search])
                          .order(sort_column + " " + sort_direction)
                          .paginate(:per_page => 10, :page => params[:page])
  end
  def show
    @warranty = Warranty.find(params[:id])
  end

  private
  def sort_column
    Warranty.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
