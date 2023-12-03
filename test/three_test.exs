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

  test "part 2 with example input" do
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

    assert Three.run2(input) == 467_835
  end

  test "part 2 with real input" do
    {:ok, input} = File.read(@input_file)
    assert Three.run2(input) == 80_179_647
  end
end
