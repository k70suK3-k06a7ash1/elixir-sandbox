defmodule Lasagna do
  # Returns the expected minutes in the oven
  def expected_minutes_in_oven do
    40
  end
  # Calculates the remaining minutes in the oven
  def remaining_minutes_in_oven(actual_minutes_in_oven) do
    expected_minutes_in_oven() - actual_minutes_in_oven
  end
  # Calculates the preparation time in minutes
  def preparation_time_in_minutes(layers) do
    layers * 2
  end
  # Calculates the total time in minutes
  def total_time_in_minutes(layers, actual_minutes_in_oven) do
    preparation_time_in_minutes(layers) + actual_minutes_in_oven
  end
  # Provides an alarm message
  def alarm do
    "Ding!"
  end
end


IO.inspect(Lasagna.expected_minutes_in_oven)
IO.inspect(Lasagna.remaining_minutes_in_oven(30))
IO.inspect(Lasagna.preparation_time_in_minutes(10))
IO.inspect(Lasagna.total_time_in_minutes(30,20))
IO.inspect(Lasagna.alarm)
