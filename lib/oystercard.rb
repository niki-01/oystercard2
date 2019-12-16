class Oystercard
    
    attr_reader :balance

    LIMIT = 90

    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(value)
        fail "Error: Maximum limit of #{LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    private

    def exceeds_max?(value)
        @balance + value >= LIMIT
    end

end