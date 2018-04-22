module CallsHelper
  def status_disabled(called, status)
    if called.status == status
      :disabled
    else
      :enabled
    end
  end
end
