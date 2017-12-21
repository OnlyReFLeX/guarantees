module Models
  module DatePeriod
    extend self
    def date_period(date, column)
      if date =~ /\A\d{4}(-)\d{2}(-)\d{2}\s(-)\s\d{4}(-)\d{2}(-)\d{2}$/ && date != "" # regex: 9999-99-99 - 9999-99-99
        date = date.split(%r{\s\S\s})
        if parsed_date(date[0]) && parsed_date(date[1])
          date[0] = DateTime.parse(date[0]).prev_day.change({hour: 21})
          date[1] = DateTime.parse(date[1]).change({hour: 20, min: 59, sec: 59})
          where("#{column} BETWEEN ? AND ?", date[0], date[1])
        else
          where(nil)
        end
      else
        where(nil)
      end
    end

    private

    def parsed_date(date)
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
end
