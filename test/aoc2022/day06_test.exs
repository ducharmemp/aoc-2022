defmodule Aoc2022.Day06Test do
  use ExUnit.Case

  import Aoc2022.Day06

  test "part1" do
    {:ok, input} = File.read("inputs/day06.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day06.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result
  end
end
