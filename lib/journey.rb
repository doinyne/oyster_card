
class Journey

  attr_reader :current_entry_station, :current_exit_station
  def initialize
    @current_entry_station = nil
    @current_exit_station = nil
    @journeys = []
  end

  def entry_station(station)
    @current_entry_station = station
  end

  def exit_station(station)
    @current_exit_station = station
  end
  
  def save_journey 
    @journeys << { :entry_station => @current_entry_station, :exit_station => @current_exit_station }
  end

  #def in_journey
   #!!@entry_station
  #end

end