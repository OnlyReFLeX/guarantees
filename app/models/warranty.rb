class Warranty < ApplicationRecord
  validates :name, presence: true
  validates :kotel, presence: true
  validates :adress, presence: true
  validates :serial, presence: true
  validates :phone, presence: true
  validates :model, presence: true
  validates :started, presence: true
  validates :datebuyed, presence: true
  validates :whodidfirststart, presence: true, if: -> { started == 'Да' }
  validates :datefirststart, presence: true, if: -> { started == 'Да' }

  def self.search(search)
    if search
      where('name ILIKE ? OR phone ILIKE ? OR kotel ILIKE ? OR model ILIKE ? OR adress ILIKE ? OR serial ILIKE ? OR datefirststart ILIKE ? OR datebuyed ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
