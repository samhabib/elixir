defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    list = String.split(path, ".")
    recursive_access(data, list)
  end

  defp recursive_access(data, []), do: data
  defp recursive_access(data, [head | tail]), do: recursive_access(data[head], tail)

  def get_in_path(data, path) do
    list = String.split(path, ".")
    Kernel.get_in(data, list)
  end
end
