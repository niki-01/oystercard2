require_relative 'oystercard'
require_relative 'journey_log'

class Journey
    MIN_FARE = 2
    PENALTY_FARE = 6

    attr_reader :entry_station, :exit_station

    def initialize
        @entry_station = nil 
        @exit_station = nil 
    end

    def starts(station) 
        @entry_station = station 
    end

    def ends(station) 
        @exit_station = station 
    end

    def fare
        (@entry_station == nil) || (@exit_station == nil) ? PENALTY_FARE : MIN_FARE
    end

    def reset 
      @entry_station = nil  
      @exit_station = nil  
    end

end