defmodule Aoc2022.$TESTNAME do
  use ExUnit.Case

  import Aoc2022.$NAME

  test "part1" do
    {:ok, input} = File.read("inputs/$LOWERNAME.txt")
    result = String.split(input, "\n")
    |> part1()

    assert result
  end

  test "part2" do
    {:ok, input} = File.read("inputs/$LOWERNAME.txt")
    result = String.split(input, "\n")
    |> part2()

    assert result
  end
end
