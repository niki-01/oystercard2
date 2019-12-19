require_relative 'oystercard'

class Journey
    MIN_FARE = 2
    PENALTY_FARE = 6

    attr_reader :journeys, :entry_station, :exit_station

    def initialize
        @entry_station = nil
        @exit_station = nil
        @journeys = []
    end

    def status? 
        @entry_station != nil
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

    def fare
        (@entry_station == nil) || (@exit_station == nil) ? PENALTY_FARE : MIN_FARE
    end

    def reset
      @entry_station = nil
      @exit_station = nil
    end

    private

    def record_journey
        @journeys << { :touch_in => @entry_station, :touch_out => @exit_station }
      end

end