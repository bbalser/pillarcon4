defmodule Pillarcon.RomanNumeral do
  @symbols [
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def convert(input) do
    Enum.reduce(@symbols, {input, ""}, fn {number, roman}, {left, buffer} ->
      times = div(left, number)
      remaining = rem(left, number)
      {remaining, buffer <> String.duplicate(roman, times)}
    end)
    |> elem(1)
  end
end
