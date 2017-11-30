class Warranty < ApplicationRecord
  validates :name, :boiler, :adress, :serial, :phone, :model, :started, :datebuyed, presence: true
  validates :whodidfirststart, :datefirststart, presence: true, if: -> { started == true }

  def self.search(search)
    if search
      where('name ILIKE ? OR phone ILIKE ? OR boiler ILIKE ? OR model ILIKE ? OR adress ILIKE ? OR serial ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
