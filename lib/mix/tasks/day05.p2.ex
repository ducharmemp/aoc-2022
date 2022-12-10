defmodule Mix.Tasks.Day05.P2 do
  use Mix.Task

  import Aoc2022.Day05

  @shortdoc "Day05 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day05.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
