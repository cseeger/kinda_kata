defmodule Bob do
  def hey(input) do
    input = String.trim(input)

    cond do
      is_forceful_question?(input) ->
        "Calm down, I know what I'm doing!"
      is_question?(input) ->
        "Sure."
      is_silent?(input) ->
        "Fine. Be that way!"
      is_yelling?(input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end

  defp is_forceful_question?(input) do
    String.ends_with?(input, "?") && is_yelling?(input)
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_silent?(input) do
    String.length(input) == 0
  end

  defp is_yelling?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end
end
