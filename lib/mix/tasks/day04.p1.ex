defmodule Mix.Tasks.Day04.P1 do
  use Mix.Task

  import Aoc2022.Day04

  @shortdoc "Day04 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day04.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
