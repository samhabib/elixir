defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    bit_size_calculator(color_count, 1)
  end

  defp bit_size_calculator(color_count, power_of \\ 1) do
    if 2 ** power_of >= color_count do
      power_of
    else
      bit_size_calculator(color_count, power_of + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    power_of = bit_size_calculator(color_count)
    <<pixel_color_index::size(power_of), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    if picture == <<>> do 
      nil
    else 
      power_of = bit_size_calculator(color_count)
      <<value::size(power_of), rest::bitstring>> = <<picture::bitstring>>
      value
    end
  end

  def drop_first_pixel(picture, color_count) do
    if picture == <<>> do 
      ""
    else 
    bit_count = palette_bit_size(color_count)
    <<value::size(bit_count), rest::bitstring>> = <<picture::bitstring>>
    rest
    end
  end
  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>> 
  end
end
