require_relative '../lib/month'

RSpec.describe Month do
  context ".header" do
    it "matches cal for December 2012" do
      month = Month.new(12, 2012)
      month.header.should == "   December 2012"
    end
    it "matches cal for July 1901" do
      month = Month.new(07, 1901)
      month.header.should == "     July 1901"
    end
  end
  
  context ".name" do
    it "translates January" do
      Month.new(1, 2012).name.should == "January"
    end
    it "translates February" do
      Month.new(2, 2012).name.should == "February"
    end
    it "translates March" do
      Month.new(3, 2012).name.should == "March"
    end
    it "translates April" do
      Month.new(4, 2012).name.should == "April"
    end
    it "translates May" do
      Month.new(5, 2012).name.should == "May"
    end
    it "translates June" do
      Month.new(6, 2012).name.should == "June"
    end
    it "translates July" do
      Month.new(7, 2012).name.should == "July"
    end
    it "translates August" do
      Month.new(8, 2012).name.should == "August"
    end
    it "translates September" do
      Month.new(9, 2012).name.should == "September"
    end
    it "translates October" do
      Month.new(10, 2012).name.should == "October"
    end
    it "translates November" do
      Month.new(11, 2012).name.should == "November"
    end
    it "translates December" do
      Month.new(12, 2012).name.should == "December"
    end
  end

  context ".length" do
    it "should give the number of days in December 2013" do
      month = Month.new(12, 2013)
      month.length.should == 31
    end
    it "should give the number of days in September 2013" do
      month = Month.new(9, 2013)
      month.length.should == 30
    end
    it "should give the number of days in February 2000" do
      month = Month.new(2, 2000)
      month.length.should == 29
    end
    it "should give the number of days in February 2002" do
      month = Month.new(2, 2002)
      month.length.should == 28
    end
  end

  context ".month_layout" do
    it "should make multi-dimensional array for days in December 2013 (5 wk month)" do
      month = Month.new(12, 2013)
      month.month_layout.should == [[1, 2, 3, 4, 5, 6, 7],
      [8, 9, 10, 11, 12, 13, 14],
      [15, 16, 17, 18, 19, 20, 21],
      [22, 23, 24, 25, 26, 27, 28],
      [29, 30, 31, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]]
    end

    it "should make multi-dimensional array for days in July 2017 (6 wk month)" do
      month = Month.new(7, 2017)
      month.month_layout.should == [[nil, nil, nil, nil, nil, nil, 1],
      [2, 3, 4, 5, 6, 7, 8],
      [9, 10, 11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20, 21, 22],
      [23, 24, 25, 26, 27, 28, 29],
      [30, 31, nil, nil, nil, nil, nil]]
    end

    it "should make multi-dimensional array for days in Feb 2015 (4 wk month)" do
      month = Month.new(2, 2015)
      month.month_layout.should == [[1, 2, 3, 4, 5, 6, 7],
      [8, 9, 10, 11, 12, 13, 14],
      [15, 16, 17, 18, 19, 20, 21],
      [22, 23, 24, 25, 26, 27, 28],
      [nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil]]
    end

    it "should make multi-dimensional array for days in August 2013 (start mid week)" do
      month = Month.new(8, 2013)
      month.month_layout.should == [[nil, nil, nil, nil, 1, 2, 3],
      [4, 5, 6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15, 16, 17],
      [18, 19, 20, 21, 22, 23, 24],
      [25, 26, 27, 28, 29, 30, 31],
      [nil, nil, nil, nil, nil, nil, nil]]
    end
  end

end
