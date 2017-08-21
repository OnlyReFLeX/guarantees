module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titlesize
    css_class = column == self.sort_column ? "current #{sort_direction}" : nil
    direction = column == self.sort_column && self.sort_direction === "asc" ? "desc" : "asc"
    link_to title, request.query_parameters.merge({ sort: column, direction: direction, page: nil }), {:class => css_class}
  end


  def success_check(kotel, size = "1")
     if kotel == 'no'
     x = "<span style='color:#FF0000;' class='fa fa-times fa-#{size}x'></span>".html_safe
    elsif kotel == "work"
     x = "<span style='color:#f0ad4e;' class='fa fa-cog fa-spin fa-#{size}x'></span>".html_safe
    else
     x = "<span style='color:#008000;' class='fa fa-check fa-#{size}x'></span>".html_safe
    end
  end
  
end
