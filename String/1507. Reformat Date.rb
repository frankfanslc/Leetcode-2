require 'pry'

def reformat_date(date)
  return StandardError if date.nil? or date.empty?

  alpha = ("a".."z").to_a
  months = {
    "Jan" => "01",
    "Feb" => "02",
    "Mar" => "03",
    "Apr" => "04",
    "May" => "05",
    "Jun" => "06",
    "Jul" => "07",
    "Aug" => "08",
    "Sep" => "09",
    "Oct" => "10",
    "Nov" => "11",
    "Dec" => "12"
  }

  if alpha.include? date[1]
    date.prepend("0")
  end

  "#{date[-4..-1]}-#{months[date[5..7]]}-#{date[0..1]}"
end

p reformat_date("20th Oct 2052")
p reformat_date("6th Jun 1933")
