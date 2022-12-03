defmodule Mix.Tasks.Day03.P1 do
  use Mix.Task

  import Aoc2022.Day03

  @shortdoc "Day03 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day03.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
