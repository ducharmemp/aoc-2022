defmodule Mix.Tasks.Day06.P2 do
  use Mix.Task

  import Aoc2022.Day06

  @shortdoc "Day06 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day06.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
