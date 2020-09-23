defmodule BijectiveMapping do
  # implementation of the following:
  # https://stackoverflow.com/questions/742013/how-do-i-create-a-url-shortener
  # also, decode algorithm from "Horner's Rule"

  @alpha_set ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z
    A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
    0 1 2 3 4 5 6 7 8 9)c
  @alpha_base 62

  def encode(num) do
    alpha_base_mapping([], num)
    |> alpha_chars()
    |> Enum.join()
  end

  def alpha_base_mapping(digits, num) when num <= 0, do: digits

  def alpha_base_mapping(digits, num) do
    remainder = rem(num, @alpha_base)
    digits = [remainder | digits]
    num = div(num, @alpha_base)

    alpha_base_mapping(digits, num)
  end

  def alpha_chars(chars) do
    Enum.map(chars, fn x ->
      Enum.at(@alpha_set, x)
    end)
  end

  def decode(encoded) do
    String.to_charlist(encoded)
    |> chars_alpha()
    |> accumulate_decode(0)
  end

  def accumulate_decode(chars, acc) when length(chars) == 0, do: acc

  def accumulate_decode(chars, acc) do
    square = :math.pow(@alpha_base, length(chars) - 1)
    [head | remaining_chars] = chars
    result = head * square
    acc = acc + result

    accumulate_decode(remaining_chars, acc)
  end

  def chars_alpha(chars) do
    Enum.map(chars, fn x ->
      Enum.find_index(@alpha_set, &(&1 == x))
    end)
  end
end
