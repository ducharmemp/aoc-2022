defmodule Aoc2022.Day06 do
  def part1(lines) do
    lines |> List.first() |> String.trim() |> String.codepoints() |> detect_start_marker(4)
  end

  def part2(lines) do
    lines |> List.first() |> String.trim() |> String.codepoints() |> detect_start_marker(14)
  end

  defp detect_start_marker(buffer, slice_size) do
    chunks = Enum.chunk_every(buffer, slice_size, 1)

    found_chunk_index =
      Enum.find_index(chunks, fn chunk -> MapSet.size(MapSet.new(chunk)) == slice_size end)

    found_chunk_index + slice_size
  end
end
