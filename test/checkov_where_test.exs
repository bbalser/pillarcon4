defmodule Pillarcon.Checkov.WhereTest do
  use ExUnit.Case

  test "messing with checkov" do
    ast =
      quote do
        assert a == b

        where([
          [:a, :b],
          [2, 2],
          [3, 3],
          [5, 10]
        ])
      end
  end
end
