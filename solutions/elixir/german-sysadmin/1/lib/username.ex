defmodule Username do
  def sanitize([]), do: []

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    [first_letter | rest] = username

    case first_letter do
      first_letter when is_integer(first_letter) and first_letter in ?a..?z ->
        [first_letter] ++ sanitize(rest)

      first_letter when first_letter == ?ä ->
        ~c"ae" ++ sanitize(rest)

      first_letter when first_letter == ?ö ->
        ~c"oe" ++ sanitize(rest)

      first_letter when first_letter == ?ü ->
        ~c"ue" ++ sanitize(rest)

      first_letter when first_letter == ?ß ->
        ~c"ss" ++ sanitize(rest)

      first_letter when first_letter == ?_ ->
        [first_letter] ++ sanitize(rest)

      _ ->
        sanitize(rest)
    end
  end
end
