module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titlesize
    css_class = column == self.sort_column ? "current #{sort_direction}" : nil
    direction = column == self.sort_column && self.sort_direction === "asc" ? "desc" : "asc"
    link_to title, request.query_parameters.merge({ sort: column, direction: direction, page: nil }), {:class => css_class}
  end


  def success_check(status, size = "1")
     if status == 'no'
     "<span style='color:#FF0000;' class='fa fa-times fa-#{size}x'></span>".html_safe
    elsif status == "work"
     "<span style='color:#f0ad4e;' class='fa fa-cog fa-spin fa-#{size}x'></span>".html_safe
    else
     "<span style='color:#008000;' class='fa fa-check fa-#{size}x'></span>".html_safe
    end
  end

end
