class Call < ApplicationRecord
  validates :username, :boiler, :adress, :call_date, :phone, :error, :guarantee, presence: true


  def self.search(search)
    if search
      where('username ILIKE ? OR phone ILIKE ? OR boiler ILIKE ? OR adress ILIKE ? OR master ILIKE ? OR error ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
