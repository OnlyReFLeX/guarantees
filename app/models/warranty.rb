class Warranty < ApplicationRecord
  validates :name, :kotel, :adress, :serial, :phone, :model, :started, :datebuyed, presence: true
  validates :whodidfirststart, :datefirststart, presence: true, if: -> { started == 'Да' }

  def self.search(search)
    if search
      where('name ILIKE ? OR phone ILIKE ? OR kotel ILIKE ? OR model ILIKE ? OR adress ILIKE ? OR serial ILIKE ? OR datefirststart ILIKE ? OR datebuyed ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
