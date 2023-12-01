defmodule OneTest do
  use ExUnit.Case

  @input_file Path.join(__DIR__, "inputs/one_input.txt")

  test "with example input" do
    input = """
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    """

    assert One.run(input) == 142
  end

  test "with real input" do
    {:ok, input} = File.read(@input_file)
    assert One.run(input) == 55971
  end
end
