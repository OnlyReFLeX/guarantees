module ApplicationHelper
  def comment_status(object)
    if object.status =='success' && object.infosuccess != ""
      object.infosuccess
    elsif object.status == 'canceled' && object.whycanceled != ""
      object.whycanceled
    else
      false
    end
  end

  def layout_style
    user_signed_in? ? "smart-style-#{current_user.design}" : 'smart-style-0'
  end
end
