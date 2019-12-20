require_relative 'journey'

 class JourneyLog

    attr_reader :journey_class, :current_journey, :history
    
    def initialize(journey_class)
        @journey_class = journey_class
        current_journey
        @history = []
    end

    def start(entry_station)
        @current_journey.starts(entry_station)
    end

    def finish(exit_station)
        @current_journey.ends(exit_station)
        reset
    end

    def immute
        @history.clone # research .clone method
    end

    private

    def current_journey
        @current_journey ||= @journey_class.new
    end

    def reset
       @history << @current_journey
       immute
       @current_journey = Journey.new
    end
    
end