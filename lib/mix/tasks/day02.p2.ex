defmodule Mix.Tasks.Day02.P2 do
  use Mix.Task

  import Aoc2022.Day02

  @shortdoc "Day02 Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/day02.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
