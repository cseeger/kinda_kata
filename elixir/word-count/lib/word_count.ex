defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    words = sentence
            |> String.downcase()
            |> String.split(~r/[^[:alnum:]-]/u, trim: true)

    Enum.reduce(words, %{}, fn word, acc ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
