module ApplicationHelper
  ALERTS = {
    'alert' => 'red', 'success' => 'green', 'notice' => 'green',
    'notify' => 'yellow', 'warning' => 'yellow', 'danger' => 'red'
  }

  def sortable(column, title = nil)
    title ||= column.titlesize
    css_class = column == self.sort_column ? "current #{sort_direction}" : nil
    direction = column == self.sort_column && self.sort_direction === "asc" ? "desc" : "asc"
    link_to title, request.query_parameters.merge({ sort: column, direction: direction, page: nil }), {:class => css_class}
  end

  def status_check(status, size = '1')
    case status
      when "canceled"
        "<span title='Отменен' style='color:#808080;' class='fa fa-times fa-#{size}x'></span>".html_safe
      when "in_progress"
        "<span title='В процессе' style='color:#f0ad4e;' class='fa fa-cog fa-spin fa-#{size}x'></span>".html_safe
      when "expect"
        "<span title='Ожидает рассмотрения' style='color:#FF0000;' class='fa fa-hourglass-start fa-#{size}x'></span>".html_safe
      when "success"
        "<span title='Выполнен' style='color:#008000;' class='fa fa-check fa-#{size}x'></span>".html_safe
    end
  end

  def comment_status(object)
    if object.status =='success' && object.infosuccess != ""
      object.infosuccess
    elsif object.status == 'canceled' && object.whycanceled != ""
      object.whycanceled
    else
      false
    end
  end

  def alert_to_color(key)
    ALERTS[key] || ''
  end
end
