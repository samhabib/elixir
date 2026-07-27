defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
  {a1, a2} = a
  {b1, b2} = b
  {(a1 * b2) + (b1 * a2), (a2 * b2)}
  |> reduce()
  end

  def reduce({a1, a2}) when a2 < 0, do: reduce({-1 * a1, -1 * a2})
  def reduce({a1, a2}) do
    gcd = Integer.gcd(a1, a2)
    cond do
      a1 == a2 -> {1, 1}
      a1 == 0 -> {0, 1}
      true -> {div(a1, gcd), div(a2, gcd)}
    end
  end
  
  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    {(a1 * b2) - (b1 * a2), (a2 * b2)}
    |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    {(a1 * b1) , (a2 * b2)}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, b1} = num
    {a2, b2} = den
    if(a2 != 0) do
      {(a1 * b2) , (a2 * b1)}
      |> reduce()
    else
      nil
    end
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, a2} = a
    {Kernel.abs(a1), Kernel.abs(a2)}
    |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, a2} = a
    if(n > 0) do
      {Integer.pow(a1, n), Integer.pow(a2, n)}
      |> reduce()
    else
      {Integer.pow(a2, n * -1), Integer.pow(a1, n * -1)}
      |> reduce()
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  {a1, a2} = n
  Float.pow(x * 1.0, a1 / a2)
  end
  @doc """
  Reduce a rational number to its lowest terms
  """

  @spec reduce(a :: rational) :: rational
  def reduce({a1, a2}) when a2 < 0, do: reduce({-1 * a1, -1 * a2})
  def reduce({a1, a2}) do
    gcd = Integer.gcd(a1, a2)
    cond do
      a1 == a2 -> {1, 1}
      a1 == 0 -> {0, 1}
      true -> {div(a1, gcd), div(a2, gcd)}
    end
  end
end
