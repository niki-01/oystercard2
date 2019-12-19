require_relative 'oystercard'
require_relative 'journey_log'

class Journey
    MIN_FARE = 2
    PENALTY_FARE = 6

    attr_reader :history, :entry_station, :exit_station

    def initialize
        @entry_station = nil # ?
        @exit_station = nil # ?
        @history = [] # JourneyLog
    end

    def status? 
        @entry_station != nil
    end

    def starts(station) # JourneyLog
        @entry_station = station
    end

    def ends(station) # JourneyLog
        @exit_station = station
        record_journey
    end

    def fare
        (@entry_station == nil) || (@exit_station == nil) ? PENALTY_FARE : MIN_FARE
    end

    def reset 
      @entry_station = nil
      @exit_station = nil
    end

    private

    def record_journey # JourneyLog
        @history << { :touch_in => @entry_station, :touch_out => @exit_station }
    end

end