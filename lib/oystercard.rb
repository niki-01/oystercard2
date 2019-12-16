class Oystercard

    attr_reader :balance, :entry_station, :exit_station, :journeys

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 2

    def initialize(balance = 0)
        @balance = balance
        @entry_station = nil
        @exit_station = nil
        @journeys = []
    end

    def top_up(value)
        fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def in_journey?
      @entry_station != nil
    end

    def touch_in(location)
      fail "Not enough credit" if min_amount?
      @entry_station = location
    end

    def touch_out(location)
      deduct(MIN_FARE)
      @exit_station = location
      record_journey
      @entry_station = nil
    end

    def journey_number(number)
      @journeys[number - 1]
    end

    private

    def exceeds_max?(value)
      @balance + value >= MAX_LIMIT
    end

    def min_amount?
      @balance <= MIN_LIMIT
    end

    def deduct(value)
      @balance -= value
    end

    def record_journey
      @journeys << {:touch_in => @entry_station, :touch_out => @exit_station}
    end
end
