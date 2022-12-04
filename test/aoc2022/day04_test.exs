defmodule Aoc2022.Day04Test do
  use ExUnit.Case

  import Aoc2022.Day04

  test "part1" do
    {:ok, input} = File.read("inputs/day04.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result == 487
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day04.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result == 849
  end
end
