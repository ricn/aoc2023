defmodule One do
  def run(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.replace(&1, ~r/[^0-9]/, ""))
    |> Enum.map(fn x -> if String.length(x) == 1, do: String.duplicate(x, 2), else: x end)
    |> Enum.map(fn x -> String.to_integer(String.first(x) <> String.last(x)) end)
    |> Enum.sum()
  end

  def run2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x ->
      %{current: _, numbers: numbers} = replace_word_numbers_with_numbers(x)
      numbers
    end)
    |> Enum.map(&String.replace(&1, ~r/[^0-9]/, ""))
    |> Enum.map(fn x -> if String.length(x) == 1, do: String.duplicate(x, 2), else: x end)
    |> Enum.map(fn x -> String.first(x) <> String.last(x) end)
    |> Enum.map(&String.to_integer(&1))
    |> Enum.sum()
  end

  defp replace_word_numbers_with_numbers(line) do
    chars = String.split(line, "", trim: true)

    Enum.reduce(chars, %{current: "", numbers: ""}, fn char, acc ->
      current = acc.current <> char

      cond do
        String.ends_with?(current, "one") || String.ends_with?(current, "1") ->
          %{current: current, numbers: acc.numbers <> "1"}

        String.ends_with?(current, "two") || String.ends_with?(current, "2") ->
          %{current: current, numbers: acc.numbers <> "2"}

        String.ends_with?(current, "three") || String.ends_with?(current, "3") ->
          %{current: current, numbers: acc.numbers <> "3"}

        String.ends_with?(current, "four") || String.ends_with?(current, "4") ->
          %{current: current, numbers: acc.numbers <> "4"}

        String.ends_with?(current, "five") || String.ends_with?(current, "5") ->
          %{current: current, numbers: acc.numbers <> "5"}

        String.ends_with?(current, "six") || String.ends_with?(current, "6") ->
          %{current: current, numbers: acc.numbers <> "6"}

        String.ends_with?(current, "seven") || String.ends_with?(current, "7") ->
          %{current: current, numbers: acc.numbers <> "7"}

        String.ends_with?(current, "eight") || String.ends_with?(current, "8") ->
          %{current: current, numbers: acc.numbers <> "8"}

        String.ends_with?(current, "nine") || String.ends_with?(current, "9") ->
          %{current: current, numbers: acc.numbers <> "9"}

        true ->
          %{current: current, numbers: acc.numbers}
      end
    end)
  end
end
