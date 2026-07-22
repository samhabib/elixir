defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, volume} = volume_pair
    volume
  end

  def to_milliliter(volume_pair) do
    case volume_pair do
    {:cup, volume} -> {:milliliter, volume * 240}
    {:fluid_ounce, volume} -> {:milliliter, volume * 30}
    {:teaspoon, volume} -> {:milliliter, volume * 5}
    {:tablespoon, volume} -> {:milliliter, volume * 15}
    {:milliliter, volume} -> {:milliliter, volume}

    end
  end

  def from_milliliter(volume_pair, unit) do
    volume = get_volume(volume_pair)
    case unit do
    :cup -> {unit, volume / 240}
    :fluid_ounce -> {unit, volume / 30}
    :teaspoon -> {unit, volume / 5}
    :tablespoon -> {unit, volume / 15}
    :milliliter -> {unit, volume}
    end
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
