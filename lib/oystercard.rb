class Oystercard

    attr_reader :balance

    LIMIT = 90

    def initialize(balance = 0)
        @balance = balance
        @journey_status = false
    end

    def top_up(value)
        fail "Error: Maximum limit of #{LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def deduct(value)
      @balance -= value
    end

    def in_journey?
      @journey_status
    end

    def touch_in
      @journey_status = true
    end

    def touch_out
      @journey_status = false
    end

    private

    def exceeds_max?(value)
        @balance + value >= LIMIT
    end

end
