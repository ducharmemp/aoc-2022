defmodule Aoc2022.Day02 do
  @rock 1
  @paper 2
  @scissors 3

  @loss_score 0
  @draw_score 3
  @win_score 6

  def part1(lines) do
    rounds = lines |> Enum.map(fn line -> String.split(line, " ") end)
    rounds |> Enum.map(&result/1) |> Enum.sum()
  end

  def part2(lines) do
    rounds = lines |> Enum.map(fn line -> String.split(line, " ") end)
    rounds |> Enum.map(&rig_the_game/1) |> Enum.map(&result/1) |> Enum.sum()
  end

  defp rig_the_game([thrown, "X"]), do: [thrown, lose(thrown)]
  defp rig_the_game([thrown, "Y"]), do: [thrown, draw(thrown)]
  defp rig_the_game([thrown, "Z"]), do: [thrown, win(thrown)]

  # Rock vs
  defp result(["A", "X"]), do: @draw_score + @rock
  defp result(["A", "Y"]), do: @win_score + @paper
  defp result(["A", "Z"]), do: @loss_score + @scissors

  # Paper vs
  defp result(["B", "X"]), do: @loss_score + @rock
  defp result(["B", "Y"]), do: @draw_score + @paper
  defp result(["B", "Z"]), do: @win_score + @scissors

  # Scissors vs
  defp result(["C", "X"]), do: @win_score + @rock
  defp result(["C", "Y"]), do: @loss_score + @paper
  defp result(["C", "Z"]), do: @draw_score + @scissors

  defp lose("A"), do: "Z"
  defp lose("B"), do: "X"
  defp lose("C"), do: "Y"

  defp draw("A"), do: "X"
  defp draw("B"), do: "Y"
  defp draw("C"), do: "Z"

  defp win("A"), do: "Y"
  defp win("B"), do: "Z"
  defp win("C"), do: "X"
end
