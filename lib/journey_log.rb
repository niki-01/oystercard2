require_relative 'journey'

 class JourneyLog
    attr_reader :journey_object, :entry_station, :exit_station, :current_journey, :history
    
    def initialize( journey_object )
        @journey_object = journey_object
        journey_class
        @entry_station
        @exit_station = nil
        @history = []
    end

    def start(entry_station = nil)
        @entry_station = entry_station
        current_journey
    end

    private

    def journey_class
        @journey_object ||= Journey.new
    end

    def current_journey
       @history << { :touch_in => @entry_station, :touch_out => @exit_station }
    end
    
end