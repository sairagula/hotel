
require 'date'
module Booking
  class DateRange
    attr_reader :checkin, :checkout

    def initialize(checkin, checkout)
      @checkin = checkin
      @checkout = checkout
      if !@checkout.is_a?(Date) || !@checkin.is_a?(Date)
        raise ArgumentError.new ("Both checkin and checkout must be valid Date objects")
      elsif @checkout < @checkin
        raise ArgumentError.new ("Entered invalid date_range")
      end
    end

    def is_included?(date)
      if date >= @checkin && date < @checkout
        return true
      else
        return false
      end
    end

    # checkin = Date.new(2017, 01, 01)
    # checkout = checkin + 3
    def number_of_nights
      return (@checkout - @checkin)
    end

  end
end
