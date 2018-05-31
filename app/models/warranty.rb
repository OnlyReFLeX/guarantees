class Warranty < ApplicationRecord
  validates :name, :boiler, :adress, :phone, :datebuyed, :serial, presence: true
  validates :started, inclusion: { in: [true, false] }
  validates :master_id, :datefirststart, presence: true, if: -> { started? }
  validates :serial, uniqueness: { case_sensitive: false }

  has_many :calls
  belongs_to :product_model
  belongs_to :master, optional: true
  belongs_to :user

  extend Models::DatePeriod

  def boiler
    product_model&.boiler.try(:name)
  end
end
