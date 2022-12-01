defmodule Mix.Tasks.$name.P2 do
  use Mix.Task

  import AdventOfCode.$name

  @shortdoc "$name Part 2"
  def run(args) do
    input = nil

    input
    |> part1()
    |> IO.inspect(label: "Part 2 Results")
  end
end
