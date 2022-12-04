defmodule Mix.Tasks.Day04.P2 do
  use Mix.Task

  import Aoc2022.Day04

  @shortdoc "Day04 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day04.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
