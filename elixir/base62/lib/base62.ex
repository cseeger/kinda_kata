defmodule Base62 do
  @moduledoc """
  Base62 encoder
  Inspired from: (rejoin url)
    https://github.com/otobus/event_bus/commit/
    956ffd93d854fb3a721aa7763c3da509cffedd41
    #diff-31f9094877d525a1b8387d4135042006R1
  """

  @mapping 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

  @doc """
  Converts given integer to base62
  """
  @spec encode(integer()) :: String.t()
  def encode(num) when num < 62 do
    << Enum.at(@mapping, num) >>
  end

  def encode(num) do
    encode(div(num, 62)) <> encode(rem(num, 62))
  end
end
