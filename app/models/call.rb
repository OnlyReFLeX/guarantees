class Call < ApplicationRecord
  validates :username, :boiler, :adress, :call_date, :phone, :error, :guarantee, presence: true


  def self.search(search)
    if search
      where('username ILIKE ? OR phone ILIKE ? OR boiler ILIKE ? OR adress ILIKE ? OR master ILIKE ? OR error ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      self.where(nil)
    end
  end

  def self.date_period(date, column)
    if date =~ /\A\d{4}(-)\d{2}(-)\d{2}\s(-)\s\d{4}(-)\d{2}(-)\d{2}$/ && date != ""
      date = date.split(%r{\s\S\s})
      if parsed_date(date[0]) && parsed_date(date[1])
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
    end
  rescue ArgumentError, TypeError
    return false
  end
end
