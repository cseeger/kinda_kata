defmodule Sieve do
  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    primes_map = Map.new(2..limit, fn x -> {x, true} end)

    primes_map = Enum.reduce(2..limit, primes_map, fn x, acc ->
      case Map.get(acc, x) do
        true -> mark_primes(acc, limit, x + x, x)
        false -> acc
      end
    end)

    Enum.filter(primes_map, fn {_, v} -> v == true end)
    |> Enum.map(fn {k, _} -> k end)
    |> Enum.sort
  end

  defp mark_primes(map, limit, start, _multiple) when start > limit do
    map
  end
  defp mark_primes(map, limit, start, multiple) do
    %{map | start => false}
    |> mark_primes(limit, start + multiple, multiple)
  end
end
