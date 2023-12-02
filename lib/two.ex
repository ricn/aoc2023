defmodule Two do
  def run(configuration, input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_game(&1))
    |> Enum.filter(&possible?(&1, configuration))
    |> Enum.map(& &1.no)
    |> Enum.sum()
  end

  defp possible?(game, configuration) do
    Enum.all?(game.sets, fn set ->
      Enum.all?(set, fn {color, amount} ->
        cond do
          color == "red" ->
            configuration.red >= amount

          color == "green" ->
            configuration.green >= amount

          color == "blue" ->
            configuration.blue >= amount
        end
      end)
    end)
  end

  defp parse_game(game) do
    no = game |> String.split(":") |> List.first() |> String.replace("Game ", "")

    sets =
      game
      |> String.replace("Game " <> no <> ":", "")
      |> String.split(";")
      |> Enum.map(&String.trim(&1))
      |> Enum.map(fn s ->
        String.split(s, ", ")
        |> Enum.map(&String.split(&1))
        |> Enum.map(fn [amount, color] ->
          {color, String.to_integer(amount)}
        end)
      end)

    %{no: String.to_integer(no), sets: sets}
  end
end
