defmodule Mix.Tasks.$name.P1 do
  use Mix.Task

  import AdventOfCode.$name

  @shortdoc "$name Part 1"
  def run(args) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
