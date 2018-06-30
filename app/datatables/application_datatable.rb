class ApplicationDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :view

  attr_reader :view
  attr_accessor :scope, :data

  def initialize(view, scope)
    @view = view
    @scope = scope
    @data ||= prepare_data!(scope)
  end

  def as_json(_options = {})
    { sEcho: params[:sEcho].to_i, iTotalRecords: @scope.count, iTotalDisplayRecords: @data.count, aaData: data_present }
  end

  private

  def data_present
    pagination_data = data.page(page).per_page(per)

    pagination_data.map do |record|
      view.k(record).row_data
    end
  end

  def prepare_data!(init_scope)
    # Global search
    if params[:search][:value].present?
      init_scope = init_scope.pg_search(params[:search][:value]) if init_scope.respond_to?(:pg_search)
    end

    # Row order
    init_scope.reorder!(sort) if params[:order].present? && sort

    # Columns filter
    columns.each_with_index do |column, index|
      search_field = column[:filter]&.[](:field)

      next unless search_field && init_scope.respond_to?("by_#{search_field}")
      next unless params['columns']
      if params['columns'][index.to_s]['search']['value'].present?
        init_scope = init_scope.public_send("by_#{search_field}", params['columns'][index.to_s]['search']['value'])
      end
    end
    init_scope
  end

  def columns
    presenter.public_send :columns if presenter.public_send(:respond_to?, :columns)
  end

  def page
    params[:start].to_i / per + 1
  end

  def per
    params[:length].to_i.positive? ? params[:length].to_i : 10
  end

  def sort
    "#{sort_column} #{sort_direction}" if sort_column
  end

  def sort_direction
    params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
  end

  def sort_column
    return unless presenter.public_send(:respond_to?, :sort_columns)
    columns = presenter.public_send :sort_columns
    columns[params[:order]['0'][:column].to_i]
  end

  def presenter
    "#{scope.model}Presenter".constantize
  end
end
