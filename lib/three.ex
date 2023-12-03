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

  def run2(input) do
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

    lines
    |> Stream.flat_map(fn {line, i} ->
      Regex.scan(~r/\*/, line, return: :index)
      |> List.flatten()
      |> Enum.map(fn {j, _} -> {i, j} end)
    end)
    |> Stream.map(fn {i, j} ->
      case Enum.filter(numbers, fn {row_span, col_span, _n} -> i in row_span and j in col_span end) do
        [a, b] -> elem(a, 2) * elem(b, 2)
        _ -> 0
      end
    end)
    |> Enum.sum()
  end
end
