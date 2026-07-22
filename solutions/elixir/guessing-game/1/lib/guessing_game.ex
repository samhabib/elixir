defmodule GuessingGame do
  
  def compare(secret_number, guess \\ :invalid )
  def compare(_secret_number, guess) when not is_number(guess) do
    "Make a guess"
  end
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end
  def compare(secret_number, guess) when secret_number + 1 == guess or secret_number - 1 == guess do
    "So close"
  end
  def compare(secret_number, guess) when guess > secret_number do
    "Too high"
  end
  def compare(secret_number, guess) when guess < secret_number do
    "Too low"
  end
  def compare(secret_number, guess) do
    cond do
    secret_number == guess -> "Correct"
    end
  end
  
end
