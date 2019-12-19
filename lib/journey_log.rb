require_relative 'journey'

 class JourneyLog
    attr_reader :journey_object, :entry_station
    
    def initialize( journey_object )
        @journey_object = journey_object
        journey_class
        @entry_station
    end

    def start(entry_station)
        @entry_station = entry_station
    end

    private

    def journey_class
        @journey_object ||= Journey.new
    end

    
    

end