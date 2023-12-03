defmodule ThreeTest do
  use ExUnit.Case

  @input_file Path.join(__DIR__, "inputs/three_input.txt")

  test "with example input" do
    input = """
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    """

    assert Three.run(input) == 4361
  end

  test "with real input" do
    {:ok, input} = File.read(@input_file)

    assert Three.run(input) == 551_094
  end
end
