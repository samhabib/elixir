defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(duration_in_oven_so_far), do: expected_minutes_in_oven() - duration_in_oven_so_far
  def preparation_time_in_minutes(number_of_layers), do: 2 * number_of_layers
  def total_time_in_minutes(number_of_layers, duration_in_oven_so_far), do: preparation_time_in_minutes(number_of_layers) + duration_in_oven_so_far
  def alarm(), do: "Ding!"
end
