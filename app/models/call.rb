class Call < ApplicationRecord
  validates :username, :boiler, :adress, :call_date, :phone, :error, presence: true
  validates :guarantee, inclusion: { in: [ true, false ] }
  validates :serial_code, presence: true, if: -> { guarantee? }
  belongs_to :warranty, optional: true

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

  def self.date_period(date, column)
    if date =~ /\A\d{4}(-)\d{2}(-)\d{2}\s(-)\s\d{4}(-)\d{2}(-)\d{2}$/ && date != "" # regex: 9999-99-99 - 9999-99-99
      date = date.split(%r{\s\S\s})
      if parsed_date(date[0]) && parsed_date(date[1])
        date[0] = DateTime.parse(date[0]).prev_day.change({hour: 21})
        date[1] = DateTime.parse(date[1]).change({hour: 20, min: 59, sec: 59})
        where("#{column} BETWEEN ? AND ?", date[0], date[1])
      else
        self.where(nil)
      end
    else
      self.where(nil)
    end
  end

  private

  def self.parsed_date(date)
    date = Date.parse(date)
    if date > Date.parse('0001-01-01') && date < Date.parse('9999-12-31')
      date
    else
      return false
    end
  rescue ArgumentError, TypeError
    return false
  end
end
