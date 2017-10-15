class Call < ApplicationRecord
  validates :username, :kotel, :adress, :date, :phone, :error, :guarantee, presence: true


  def self.search(search)
    if search
      where('username ILIKE ? OR phone ILIKE ? OR kotel ILIKE ? OR adress ILIKE ? OR date ILIKE ? OR master ILIKE ? OR error ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
