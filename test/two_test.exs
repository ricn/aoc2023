defmodule TwoTest do
  use ExUnit.Case

  @input_file Path.join(__DIR__, "inputs/two_input.txt")

  test "with example input" do
    input = """
    Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
    Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
    Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
    Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
    Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
    """

    configuration = %{red: 12, green: 13, blue: 14}

    assert Two.run(configuration, input) == 8
  end

  test "with real input" do
    {:ok, input} = File.read(@input_file)
    configuration = %{red: 12, green: 13, blue: 14}

    assert Two.run(configuration, input) == 1853
  end
end
