require_relative 'oystercard'

class Journey
    attr_reader :journeys, :entry_station, :exit_station

    def initialize
        @entry_station = nil
        @exit_station = nil
        @journeys = []
    end

    def in_journey? 
        !!entry_station
    end

    def starts(location)
        @entry_station = location
    end

    def ends(location)
        @exit_station = location
        record_journey 
    end
 
    def journey_number(number)
        @journeys[number - 1]
    end

    private

    def record_journey
        journey = { :touch_in => @entry_station, :touch_out => @exit_station }
        @journeys << journey
        @entry_station = nil
      end

end

# Journey class: start a journey, finish, calculate fare, return if journey is complete
# We want to put a penalty fare (.deduct penalty fare of 6) if user touch_out && touch_in == nil
# Repeat if there was a touch_in but no touch_out