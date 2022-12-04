defmodule Aoc2022.Day04 do
  def part1(lines) do
    assignments = assign_elves(lines)

    overlaps =
      for [first_assignment, second_assignment] <- assignments do
        if MapSet.subset?(first_assignment, second_assignment) or
             MapSet.subset?(second_assignment, first_assignment) do
          1
        else
          0
        end
      end

    Enum.sum(overlaps)
  end

  def part2(lines) do
    assignments = assign_elves(lines)

    overlaps =
      for [first_assignment, second_assignment] <- assignments do
        unless MapSet.disjoint?(first_assignment, second_assignment) do
          1
        else
          0
        end
      end

    Enum.sum(overlaps)
  end

  defp assign_elves(lines) do
    for line <- lines do
      pairs = String.split(line, ",")

      [first_range, second_range] =
        for pair <- pairs do
          [start_of_range, end_of_range] = String.split(pair, "-")

          [start_of_range, end_of_range] = [
            String.to_integer(start_of_range),
            String.to_integer(end_of_range)
          ]

          Enum.to_list(start_of_range..end_of_range)
        end

      [MapSet.new(first_range), MapSet.new(second_range)]
    end
  end
end
