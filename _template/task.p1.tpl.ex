defmodule Mix.Tasks.$NAME.P1 do
  use Mix.Task

  import Aoc2022.$NAME

  @shortdoc "$NAME Part 1"
  def run(_args) do
    {:ok, input} = File.read("inputs/$LOWERNAME.txt")

    String.split(input, "\n")
    |> part1()
    |> IO.inspect(label: "Part 1 Results")
  end
end
