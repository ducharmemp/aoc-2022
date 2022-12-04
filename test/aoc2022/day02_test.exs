defmodule Aoc2022.Day02Test do
  use ExUnit.Case

  import Aoc2022.Day02

  test "part1" do
    {:ok, input} = File.read("inputs/day02.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result == 13484
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day02.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result == 13433
  end
end
