defmodule Three do
  def run(input) do
    lines = input |> String.split("\n") |> Enum.with_index()

    numbers =
      lines
      |> Enum.flat_map(fn {line, i} ->
        Regex.scan(~r/\d+/, line, return: :index)
        |> List.flatten()
        |> Enum.map(fn {j, len} ->
          {(i - 1)..(i + 1)//1, (j - 1)..(j + len)//1,
           String.to_integer(String.slice(line, j, len))}
        end)
      end)

    symbol_positions =
      lines
      |> Stream.flat_map(fn {line, i} ->
        Regex.scan(~r/[^a-zA-Z0-9\.]/, line, return: :index)
        |> List.flatten()
        |> Enum.map(fn {j, _} -> {i, j} end)
      end)
      |> MapSet.new()

    numbers
    |> Stream.filter(fn {row_span, col_span, _n} ->
      for i <- row_span,
          j <- col_span,
          reduce: false,
          do: (acc -> acc || {i, j} in symbol_positions)
    end)
    |> Stream.map(&elem(&1, 2))
    |> Enum.sum()
  end
end
