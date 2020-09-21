defmodule RotationalCipher do
  def rotate(text, shift) do
    String.to_charlist(text)
    |> Enum.map(&(rotate_single(&1, shift)))
    |> List.to_string()
  end

  def rotate_single(char, 0), do: char
  def rotate_single(char, 26), do: char
  def rotate_single(char, shift) when char in ?A..?Z do
    cond do
      char == ?Z -> rotate_single(?A, shift - 1)
      true -> rotate_single(char + 1, shift - 1)
    end
  end
  def rotate_single(char, shift) when char in ?a..?z do
    cond do
      char == ?z -> rotate_single(?a, shift - 1)
      true -> rotate_single(char + 1, shift - 1)
    end
  end
  def rotate_single(char, _shift), do: char
end
