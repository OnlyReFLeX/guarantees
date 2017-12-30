class Boiler < ApplicationRecord
  validates :name, presence: true, :uniqueness => {:case_sensitive => false}
  has_many :product_models, dependent: :destroy
end
