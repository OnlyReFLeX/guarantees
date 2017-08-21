class Call < ApplicationRecord
  validates :username, presence: true
  validates :kotel, presence: true
  validates :adress, presence: true
  validates :date, presence: true
  validates :phone, presence: true
  validates :error, presence: true
  validates :guarantee, presence: true
  def self.search(search)
    if search
      where('username ILIKE ? OR phone ILIKE ? OR kotel ILIKE ? OR adress ILIKE ? OR date ILIKE ? OR master ILIKE ? OR error ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
