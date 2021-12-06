class Lanternfish
  def initialize(age = 8)
    @age = age
  end

  # Increase age by a day.
  # Possibly return a new Lanternfish.
  def age
    @age -= 1

    if @age < 0
      @age = 6

      Lanternfish.new
    end
  end

  def get_age
    @age
  end
end