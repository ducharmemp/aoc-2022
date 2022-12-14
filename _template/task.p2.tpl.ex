defmodule Mix.Tasks.$NAME.P2 do
  use Mix.Task

  import Aoc2022.$NAME

  @shortdoc "$NAME Part 2"
  def run(_args) do
    {:ok, input} = File.read("inputs/$LOWERNAME.txt")

    String.split(input, "\n")
    |> part2()
    |> IO.inspect(label: "Part 2 Results")
  end
end
