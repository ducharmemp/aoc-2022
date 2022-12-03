defmodule Mix.Tasks.Day03.P2 do
  use Mix.Task

  import Aoc2022.Day03

  @shortdoc "Day03 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day03.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
