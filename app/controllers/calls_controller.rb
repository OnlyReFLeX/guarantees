class CallsController < ApplicationController
  include ApplicationHelper
  helper_method :sort_column, :sort_direction

  def index
    @calls = Call.date_period(params[:call_date_start], params[:call_date_end], 'call_date')
                 .date_period(params[:created_at_start], params[:created_at_end], 'created_at')
                 .order(sort_column + " " + sort_direction)
                 .paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @called = Call.find(params[:id])
  end

  private

  def sort_column
    Call.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
