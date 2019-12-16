class Oystercard
    
    attr_reader :balance

    MAX_VALUE = 90

    def initialize(balance = 0)
        @balance = balance
    end

    def top_up(value)
        fail 'Error: Maximum limit reached' if exceeds_max?(value)
        @balance += value
    end

    private

    def exceeds_max?(value)
        @balance + value >= MAX_VALUE 
    end

end