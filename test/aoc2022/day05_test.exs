defmodule Aoc2022.Day05Test do
  use ExUnit.Case

  import Aoc2022.Day05

  test "part1" do
    {:ok, input} = File.read("inputs/day05.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day05.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result
  end
end
