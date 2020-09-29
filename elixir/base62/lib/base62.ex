defmodule Base62 do
  # discussion:
  # https://stackoverflow.com/questions/742013/how-do-i-create-a-url-shortener
  #
  # with code from:
  # https://github.com/otobus/event_bus/commit/
  # 956ffd93d854fb3a721aa7763c3da509cffedd41
  # diff-31f9094877d525a1b8387d4135042006R1
  #
  # also, decode algorithm from "Horner's Rule"

  @mapping 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  @radix 62

  def encode(num) when num < @radix do
    << Enum.at(@mapping, num) >>
  end

  def encode(num) do
    encode(div(num, @radix)) <> encode(rem(num, @radix))
  end

  def decode(encoded) do
    String.to_charlist(encoded)
    |> char_indexes()
    |> accumulate_decode(0)
    |> trunc()
  end

  def accumulate_decode(chars, acc) when length(chars) == 0, do: acc

  def accumulate_decode(chars, acc) do
    square = :math.pow(@radix, length(chars) - 1)
    [head | remaining_chars] = chars
    result = head * square
    acc = acc + result

    accumulate_decode(remaining_chars, acc)
  end

  def char_indexes(chars) do
    Enum.map(chars, fn x ->
      Enum.find_index(@mapping, &(&1 == x))
    end)
  end
end
