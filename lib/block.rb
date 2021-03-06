require 'date_range'

module Booking
  class Block
    attr_reader :block_name, :date_range, :available_rooms, :discounted_room_rate, :already_reserved_rooms

    def initialize(block_name, date_range, rooms, discounted_room_rate)
      @block_name = block_name
      @date_range = date_range
      @available_rooms = rooms
      @already_reserved_rooms = []
      @discounted_room_rate = discounted_room_rate
    end

    def has_room_number?(room_number)
      return (@available_rooms.include?(room_number) || @already_reserved_rooms.include?(room_number))
    end

    def reserve_a_room(room_number)
      already_reserved_rooms  << room_number
      available_rooms.delete(room_number)
    end

    def is_room_blocked_for_date_range?(requested_date_range, room_number)
      return requested_date_range.overlaps?(@date_range) && has_room_number?(room_number)
    end
  end
end
