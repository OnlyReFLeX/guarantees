module Models
  module DatePeriod
    extend self
    def date_period(date_start, date_end, column)
      if parsed_date(date_start) && parsed_date(date_end)
        date_start = DateTime.parse(date_start).prev_day.change({hour: 21})
        date_end = DateTime.parse(date_end).change({hour: 20, min: 59, sec: 59})
        where("#{column} BETWEEN ? AND ?", date_start, date_end)
      else
        where(nil)
      end
    end

    private

    def parsed_date(date)
      date = DateTime.parse(date)
      if date > DateTime.parse('0001-01-01') && date < DateTime.parse('9999-12-31')
        date
      else
        return false
      end
    rescue ArgumentError, TypeError
      return false
    end
  end
end
