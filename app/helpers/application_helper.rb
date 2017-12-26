module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titlesize
    css_class = column == self.sort_column ? "current #{sort_direction}" : nil
    direction = column == self.sort_column && self.sort_direction === "asc" ? "desc" : "asc"
    link_to title, request.query_parameters.merge({ sort: column, direction: direction, page: nil }), {:class => css_class}
  end


  def status_check(status, size = "1")
    case status
      when "canceled"
        "<span style='color:#808080;' class='fa fa-times fa-#{size}x'></span>".html_safe
      when "in_progress"
        "<span style='color:#f0ad4e;' class='fa fa-cog fa-spin fa-#{size}x'></span>".html_safe
      when "expect"
        "<span style='color:#FF0000;' class='fa fa-hourglass-start fa-#{size}x'></span>".html_safe
      when "success"
        "<span style='color:#008000;' class='fa fa-check fa-#{size}x'></span>".html_safe
    end
  end
end
