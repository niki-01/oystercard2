require_relative 'oystercard'

class Journey
    attr_reader :journeys, :entry_station, :exit_station

    def initialize
        @entry_station = nil
        @exit_station = nil
        @journeys = []
        @station = Station
    end

    def in_journey? 
        !!entry_station
    end

    def starts(station)
        @entry_station = station
    end

    def ends(station)
        @exit_station = station
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