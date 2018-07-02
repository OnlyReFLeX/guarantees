class Warranty < ApplicationRecord
  include PgSearch
  include Filterable
  include Scopes::Warranty

  validates :name, :adress, :phone, :datebuyed, :serial, presence: true
  validates :started, inclusion: { in: [true, false] }
  validates :master_id, :datefirststart, presence: true, if: -> { started? }
  validates :serial, uniqueness: { case_sensitive: false }

  has_many :calls
  belongs_to :product_model
  belongs_to :master, optional: true
  belongs_to :user

  pg_search_scope :search_by, against: %i[id name phone adress comment], using: { tsearch: { prefix: true } },
                              associated_against: { product_model: :name, master: :name }

  def self.pg_search(query)
    query.blank? ? [] : search_by(query)
  end
end
