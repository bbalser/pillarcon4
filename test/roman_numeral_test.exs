defmodule Pillarcon.RomanNumeralTest do
  use ExUnit.Case

  import Checkov

  data_test "convert(#{input}) returns #{expected}" do
    actual = Pillarcon.RomanNumeral.convert(input)
    assert expected == actual

    where([
      [:input, :expected],
      [1, "I"],
      [2, "II"],
      [4, "IV"],
      [5, "V"],
      [6, "VI"],
      [9, "IX"],
      [10, "X"],
      [20, "XX"]
    ])
  end
end
