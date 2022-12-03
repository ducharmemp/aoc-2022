defmodule Aoc2022.Day03 do
  def part1(lines) do
    lines
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&split/1)
    |> Enum.flat_map(fn {first_half, second_half} ->
      MapSet.intersection(MapSet.new(first_half), MapSet.new(second_half))
    end)
    |> Enum.map(&calculate_priorities/1)
    |> Enum.sum()
  end

  def part2(lines) do
    lines
    |> Enum.map(&String.graphemes/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.chunk_every(3)
    |> Enum.flat_map(fn group ->
      Enum.reduce(tl(group), hd(group), fn item, acc -> MapSet.intersection(item, acc) end)
    end)
    |> Enum.map(&calculate_priorities/1)
    |> Enum.sum()
  end

  defp split(list) do
    len = round(length(list) / 2)
    Enum.split(list, len)
  end

  def calculate_priorities(<<c::utf8, _::binary>>) when c >= ?a and c <= ?z, do: c - ?a + 1
  def calculate_priorities(<<c::utf8, _::binary>>) when c >= ?A and c <= ?Z, do: c - ?A + 27
  def calculate_priorities(_), do: :error
end
