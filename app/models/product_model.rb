class ProductModel < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :boiler
  has_many :calls
  has_many :warranties

  scope :order_by_boiler, -> { includes(:boiler).order('boilers.name') }

  def full_name
    "#{boiler.name} #{name}"
  end
end
