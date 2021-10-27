class Oystercard
  attr_reader :balance, :limit, :entry_station
  DEFAULT_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(limit = DEFAULT_LIMIT)
    @balance = 0
    @limit = limit
    # @in_use = false
    @entry_station    
  end

  def top_up(amount)
    @balance + amount > @limit ? fail('Max limit of #{default_limit} GBP reached') : @balance += amount
  end

  def touch_in(station)
    if @balance < MINIMUM_AMOUNT
      fail "Please top up"
    else
      # @in_use = true
      @entry_station = station
    end
  end

  def touch_out
    deduct(MINIMUM_AMOUNT)
    # @in_use = false
    @entry_station = nil
  end
  
  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end