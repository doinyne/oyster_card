

class Journey
  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def entry_station(station)
    @entry_station = station
  end

  def exit_station(station)
    @exit_station = station
  end
  
  def save_journey 
    @journeys << { :entry_station => @entry_station, :exit_station => station }
  end

  def in_journey
    !!@entry_station
  end

end