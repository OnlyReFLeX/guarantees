class Call < ApplicationRecord
  include PgSearch
  include Filterable
  include Scopes::Call

  pg_search_scope :search_by, against: [:id, :username, :phone, :adress, :status, :guarantee, :error], using: { tsearch: { prefix: true } },
                              associated_against: { product_model: :name, master: :name, warranty: :serial }

  validates :username, :adress, :call_date, :phone, :error, presence: true
  validates :guarantee, inclusion: { in: [true, false] }
  validates :status, inclusion: { in: %w[success canceled in_progress expect] }
  validates :serial_code, presence: true, if: -> { guarantee? }
  belongs_to :warranty, optional: true
  belongs_to :product_model
  belongs_to :master, optional: true
  belongs_to :user

  def serial_code
    warranty.try(:serial)
  end

  def serial_code=(serial)
    self.warranty = Warranty.find_by(serial: serial) if serial.present?
  end

  def self.pg_search(query)
    query.blank? ? [] : search_by(query)
  end
end
