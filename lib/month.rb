require_relative "zellers_congruence"

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  # MONTHS is a constant

  def initialize(month, year)
    @month = month
    @year = year
  end

  def length
    length = 30 + (@month + (@month/8).floor) % 2

    # check for leap year
    if @month == 2
      if (@year % 4 == 0) && (@year % 100 != 0) || (@year % 400 == 0)
        length -= 1
      else
        length -= 2
      end
    end
    length
  end

  def header
    "#{name} #{@year}".center(20).rstrip  #.center centers a string within 20 spaces; rstrip takes off the white space at the end of it
  end

  def name
    MONTHS[@month]
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa\n"
    month_layout.each do |week|
      week.map! do |day|
        if day == nil
          day = "  "
        else
          day < 10 ? " " + day.inspect : day  # .inspect returns a string
          # if it's one digit, give it an extra space; otherwise, just add the day (with two digits - such as '10')
        end
      end
      week = week.join(" ")
      output << week + "\n"  # appends string of days to the output
    end
    output
  end

  def month_layout
    month_array = [[], [], [], [], [], []]
    month_array = week_array(month_array)
    month_array
  end


  def week_array(arr)
    d = 1  # this is the first value that will be pushed into the array
    index = ZellersCongruence.calculate(@month, @year)  # figures out the starting point, the day of the week
    x = 7 - index  # makes the days line up with the index of the array
    x.times do
      arr[0].insert(index, d)
      index += 1
      d +=1
    end
    num = 1
    5.times do
      7.times do
        if d <= length
          arr[num].push(d)
          d += 1
        else
          arr[num].push(nil)
        end
      end
      num += 1
    end
    arr
  end

end
