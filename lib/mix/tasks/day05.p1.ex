defmodule Mix.Tasks.Day05.P1 do
  use Mix.Task

  import Aoc2022.Day05

  @shortdoc "Day05 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day05.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
