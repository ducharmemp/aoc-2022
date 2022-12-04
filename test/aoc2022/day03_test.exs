defmodule Aoc2022.Day03Test do
  use ExUnit.Case

  import Aoc2022.Day03

  test "part1" do
    {:ok, input} = File.read("inputs/day03.txt")

    result =
      String.split(input, "\n")
      |> part1()

    assert result == 8153
  end

  test "part2" do
    {:ok, input} = File.read("inputs/day03.txt")

    result =
      String.split(input, "\n")
      |> part2()

    assert result == 2342
  end
end
