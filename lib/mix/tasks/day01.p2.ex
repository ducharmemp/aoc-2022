defmodule Mix.Tasks.Day01.P2 do
  use Mix.Task

  import Aoc2022.Day01

  @shortdoc "Day01 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day01.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
