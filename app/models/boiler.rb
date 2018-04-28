class Boiler < ApplicationRecord
  has_many :product_models, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
