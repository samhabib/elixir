defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0
  def apply_discount(before_discount, discount) do 
    before_discount * ((100 - discount) / 100)

  end
  def monthly_rate(hourly_rate, discount) do
    daily_rate = apply_discount(hourly_rate, discount)
    |> daily_rate()
    daily_rate * 22
    |> ceil()
  end
  def days_in_budget(budget, hourly_rate, discount) do
    discounted_daily_rate = apply_discount(hourly_rate, discount) 
    |> daily_rate()
    
    budget / discounted_daily_rate
    |> Float.floor(1)
  end
end
