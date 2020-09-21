defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  def verse(number) do
    lyric(number)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  def lyrics(), do: lyrics(99..0)
  def lyrics(range) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  defp lyric(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  defp lyric(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end
  defp lyric(2) do
    """
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    """
  end
  defp lyric(number) do
    """
    #{number} bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{number-1} bottles of beer on the wall.
    """
  end
end
