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

    test_body = Macro.prewalk(ast, fn exp ->
      case match?({:where, _, _}, exp) do
        true -> nil
        false -> exp
      end
    end)

    Macro.to_string(test_body) |> IO.puts()

  end
end
