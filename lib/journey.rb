require_relative 'oystercard'
require_relative 'journey_log'

class Journey
    MIN_FARE = 2
    PENALTY_FARE = 6

    attr_reader :history, :entry_station, :exit_station

    def initialize
        @entry_station = nil # JourneyLog
        @exit_station = nil # JourneyLog
        @history = [] # JourneyLog
    end

    def starts(station) 
        @entry_station = station # JourneyLog
    end

    def ends(station) 
        @exit_station = station # JourneyLog
        record_journey # JourneyLog
    end

    def fare
        (@entry_station == nil) || (@exit_station == nil) ? PENALTY_FARE : MIN_FARE # Journey
    end

    def reset 
      @entry_station = nil  # Journey
      @exit_station = nil   # Journey
    end

    private

    def record_journey
        @history << { :touch_in => @entry_station, :touch_out => @exit_station } # JourneyLog
    end

end