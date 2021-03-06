require_relative 'container'

# important class which handles passenger interactions with tube system
class Station
  include Container

  attr_reader :trains

  DEFAULT_PLATFORMS = 2

  def initialize(options = {})
    @platform_numbers = options.fetch(:platforms, DEFAULT_PLATFORMS)
    @trains = {}
  end

  def arrived_at_platform(train, platform_number)
    fail 'Sorry plaform is in use now' if @trains.values.include?(platform_number)
    fail 'Platform does not exist!' if platform_number > @platform_numbers
    trains[train] = platform_number
  end

  def release_train(train)
    trains.delete(train)
  end

  def touch_in(passenger)
    fail 'There is not enough money on your account' if passenger.credit < 2
    enter(passenger)
  end

  def touch_out(passenger)
    leave(passenger)
    passenger.deduct
  end

  def train_at_the_station?(train)
    @trains.include?(train)
  end

  def train_not_at_the_station?(train)
    !train_at_the_station?(train)
  end
end
