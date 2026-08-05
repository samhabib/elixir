defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      checkout_datetime
      |> NaiveDateTime.shift(day: 28)
      |> NaiveDateTime.to_date()
    else
      checkout_datetime
      |> NaiveDateTime.shift(day: 29)
      |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    Date.diff(actual_return_datetime, planned_return_date)
    |> max(0)
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_day = datetime_from_string(checkout)
    return_date = return_date(checkout_day)
    returned_day = datetime_from_string(return)
    num_of_days_late = days_late(return_date, returned_day)

    if monday?(returned_day) do
      trunc(num_of_days_late * rate * 0.5)
    else
      num_of_days_late * rate
    end
  end
end
