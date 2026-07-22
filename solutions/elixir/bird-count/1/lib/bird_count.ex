defmodule BirdCount do
  def today([]), do: nil

  def today(list) do
    [head | _tail] = list
    head
  end

  def increment_day_count([]), do: [1]

  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?(list) do
    [head | tail] = list

    if head == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  def total([]), do: 0

  def total(list) do
    [head | tail] = list
    total(tail, head)
  end

  defp total([], acc), do: acc

  defp total([head | tail], acc) do
    acc = acc + head
    total(tail, acc)
  end

  def busy_days(list) do
    busy_days(list, 0)
  end

  defp busy_days([], acc), do: acc

  defp busy_days([head | tail], acc) do
    if head >= 5 do
      acc = acc + 1
      busy_days(tail, acc)
    else
      busy_days(tail, acc)
    end
  end
end
