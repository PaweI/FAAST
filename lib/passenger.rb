class Passenger

  attr_reader :credit

  attr_accessor :in_the_tube

  TRIP_COST = 2

  DEFAULT_CREDIT = 2

  def initialize(options={})
    @credit = options.fetch(:credit, DEFAULT_CREDIT )
    @in_the_tube = false
  end

  def deduct
    @credit -= TRIP_COST
  end

  def touch_in(station)
    station.touch_in(self)
  end

  def touch_out(station)
    station.touch_out(self)
  end

  def board(train, coach_number, station)
    train[coach_number].board(self) if station.trains.include?(train)
    station.leave(self)
  end

  def alight(train, coach_number, station)
    train[coach_number].alight(self) if station.trains.include?(train)
    station.enter(self)
  end

end