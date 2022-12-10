defmodule Mix.Tasks.Day06.P1 do
  use Mix.Task

  import Aoc2022.Day06

  @shortdoc "Day06 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day06.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
