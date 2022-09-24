require 'csv'
require 'time'

count_days_arr = []
count_hours_arr = []

def clean_tel(tel)
  tel = tel.delete("^0-9")

  if tel.length == 10
    "(#{tel[0..2]}) #{tel[3..5]}-#{tel [6..9]}"
  elsif tel.length == 11 && tel[0] == 1
    "(#{tel[1..3]}) #{tel[4..6]}-#{tel[7..10]}"
  else
    "Wrong Number"
  end
end

def clean_date(date)
  Date.strptime(date, '%m/%d/%y')
end

def convert_to_weekday(date)
  date.strftime('%A')
end

def peak_days(weekdays_arr)
  # p weekdays_arr
  count_weekday_hash = weekdays_arr.uniq.map {|day, count| [day, weekdays_arr.count(day)]}
  # sort_weekday_hash = count_weekday_hash.sort_by {|day, count| count}.reverse
  peak_day = count_weekday_hash.minmax_by {|day, count| count}.max
  return peak_day[0]
end

def clean_time(time)
  Time.strptime(time,'%k:%M').strftime("%k:%M")
  # time
end

def convert_to_hour(time)
  Time.strptime(time,'%k:%M').hour
  # Time.strptime(time,'%k:%M').strftime('%k')
end

def peak_hours(hours_arr)
  count_hours_hash = hours_arr.uniq.map {|hour, count| ["#{hour}:00", hours_arr.count(hour)]}
  # sort_hours_hash = count_hours_hash.sort_by {|hour, count| count}.reverse
  peak_hour = count_hours_hash.minmax_by {|hour, count| count}.max
  return peak_hour[0]
end

# =========================================

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    tel = clean_tel(row[:homephone]) 

    date = clean_date(row[:regdate].split(' ')[0])
    weekday = convert_to_weekday(date)
    count_days_arr.push(weekday)

    time = clean_time(row[:regdate].split(' ')[1])
    hour = convert_to_hour(time)
    count_hours_arr.push(hour)

    # puts "Name: #{name}, Tel: #{tel}, Reg date: #{date}, Reg weekday: #{weekday}, Reg time: #{time}, Reg hour: #{hour}"
end

puts "Peak registration hours: #{peak_hours(count_hours_arr)}" 
puts "Peak registration days: #{peak_days(count_days_arr)}" 