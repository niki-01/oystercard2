class Oystercard

    attr_reader :balance

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 2

    def initialize(balance = 0)
        @balance = balance
        @journey_status = false
    end

    def top_up(value)
        fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def in_journey?
      @journey_status
    end

    def touch_in
      fail "Not enough credit" if min_amount?
      @journey_status = true
    end

    def touch_out
      deduct
      @journey_status = false
    end

    private

    def exceeds_max?(value)
      @balance + value >= MAX_LIMIT
    end

    def min_amount?
      @balance <= MIN_LIMIT
    end

    def deduct
      @balance -= MIN_FARE
    end
end
