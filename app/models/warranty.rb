class Warranty < ApplicationRecord
  validates :name, :boiler, :adress, :phone, :model, :datebuyed, presence: true
  validates :started, inclusion: { in: [ true, false ] }
  validates :whodidfirststart, :datefirststart, presence: true, if: -> { started? }
  validates :serial, :uniqueness => {:case_sensitive => false}
  has_many :calls


  extend Models::DatePeriod

  def self.search(search)
    if search
      where('name ILIKE ? OR phone ILIKE ? OR boiler ILIKE ? OR model ILIKE ? OR adress ILIKE ? OR serial ILIKE ?',
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
