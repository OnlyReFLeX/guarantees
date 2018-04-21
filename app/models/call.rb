class Call < ApplicationRecord
  validates :username, :boiler, :adress, :call_date, :phone, :error, presence: true
  validates :guarantee, inclusion: { in: [true, false] }
  validates :status, inclusion: { in: %w[success canceled in_progress expect] }
  validates :serial_code, presence: true, if: -> { guarantee? }
  belongs_to :warranty, optional: true

  extend Models::DatePeriod

  def serial_code
    warranty.try(:serial)
  end

  def serial_code=(serial)
    self.warranty = Warranty.find_by(serial: serial) if serial.present?
  end

  def self.search(search)
    if search
      where('username ILIKE ? OR phone ILIKE ? OR boiler ILIKE ? OR adress ILIKE ? OR master ILIKE ? OR error ILIKE ?',
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end
end
