defmodule Mix.Tasks.Day01.P1 do
  use Mix.Task

  import Aoc2022.Day01

  @shortdoc "Day01 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day01.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
