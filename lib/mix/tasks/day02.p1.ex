defmodule Mix.Tasks.Day02.P1 do
  use Mix.Task

  import Aoc2022.Day02

  @shortdoc "Day02 Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/day02.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
