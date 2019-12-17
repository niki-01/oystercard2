require_relative 'journey'

class Oystercard

  attr_reader :balance, :journey

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  MIN_FARE = 2

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    @journey = journey
  end

  def top_up(value)
    fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
    @balance += value
  end

  def touch_in(location)
    @journey.starts(location)
    fail "Not enough credit" if min_amount? 
  end

  def touch_out(location)
    @journey.ends(location)
    deduct(MIN_FARE)
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
  
end
