require_relative 'journey'

class Oystercard
  attr_reader :balance, :journeys, :entry_station
  CARD_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1
  FINE = 6


  def initialize
    @balance = 0
    @journey = Journey.new
    @entry_station
  end

  def top_up(amount)
    fail "The limit is #{CARD_LIMIT}, can not add more money on your oystercard!" if exceeds_limit?(amount)
    @balance += amount 
  end
  
  def touch_in(station)
    penalty() if !!@journey.current_entry_station
    fail "Insufficient amount" if balance < MINIMUM_BALANCE
    @journey.entry_station(station)
  end

  def touch_out(station)
   if !!!@journey.current_entry_station
     penalty()
   else
    deduct()
   end
    @journey.exit_station(station)
    @journey.save_journey
    @journey.entry_station(nil)
    @journey.exit_station(nil)
  end

  private

  def exceeds_limit?(amount)
    @balance + amount > CARD_LIMIT
  end

  def deduct
    @balance -= FARE
  end

  def penalty
    @balance -= FINE 
    puts "You have been fined"
    @journey.entry_station(nil)
    @journey.exit_station(nil)
  end
end