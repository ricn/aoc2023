defmodule One do
  def run(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.replace(&1, ~r/[^0-9]/, ""))
    |> Enum.map(fn x -> if String.length(x) == 1, do: String.duplicate(x, 2), else: x end)
    |> Enum.map(fn x -> String.first(x) <> String.last(x) end)
    |> Enum.map(&String.to_integer(&1))
    |> Enum.sum()
  end
end
