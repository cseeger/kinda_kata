defmodule Hexadecimal do
  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex = String.downcase(hex)

    if String.match?(hex, ~r/^[0-9a-f]+$/) do
      hex
      |> String.graphemes
      |> Enum.map(&to_decimal_digit/1)
      |> Enum.reverse
      |> Enum.with_index
      |> convert_to_decimal_values
      |> trunc
    else
      0
    end
  end

  defp to_decimal_digit("a"), do: 10
  defp to_decimal_digit("b"), do: 11
  defp to_decimal_digit("c"), do: 12
  defp to_decimal_digit("d"), do: 13
  defp to_decimal_digit("e"), do: 14
  defp to_decimal_digit("f"), do: 15
  defp to_decimal_digit(hex_digit) do
    String.to_integer(hex_digit)
  end

  defp convert_to_decimal_values(digits) do
    Enum.reduce(digits, 0, fn {k, v}, acc ->
      acc + (k * :math.pow(16,v))
    end)
  end
end
