class Call < ApplicationRecord
  validates :username, :boiler, :adress, :call_date, :phone, :error, presence: true
  validates :guarantee, inclusion: { in: [true, false] }
  validates :status, inclusion: { in: %w[success canceled in_progress expect] }
  validates :serial_code, presence: true, if: -> { guarantee? }
  belongs_to :warranty, optional: true
  belongs_to :product_model
  belongs_to :master, optional: true
  belongs_to :user


  extend Models::DatePeriod

  def boiler
    product_model&.boiler.try(:name)
  end

  def serial_code
    warranty.try(:serial)
  end

  def serial_code=(serial)
    self.warranty = Warranty.find_by(serial: serial) if serial.present?
  end
end
