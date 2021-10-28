require_relative 'journey'

class Oystercard
  attr_reader :balance, :journeys, :entry_station
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1
  FINE = 6


  def initialize
    @balance = 0
    @journeys = []
    @entry_station
  end

  def top_up(amount)
    fail "The limit is #{CARD_LIMIT}, can not add more money on your oystercard!" if exceeds_limit?(amount)
    @balance += amount 
  end
  
  def touch_in(station)
    @balance -= FINE if Journey.in_journey
    fail "Insufficient amount" if balance < MINIMUM_BALANCE
    Journey.entry_station(station)
  end

  def touch_out(station)
    deduct(FARE)
    Journey.exit_station(station)
    Journey.save_journey
  end

  private

  def exceeds_limit?(amount)
    @balance + amount > CARD_LIMIT
  end

  def deduct(fare)
    @balance -= FARE
  end
end