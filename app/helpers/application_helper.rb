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
end
