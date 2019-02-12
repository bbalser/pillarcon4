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

    {test_body, where} = Macro.prewalk(ast, nil, fn exp, acc ->
      case match?({:where, _, _}, exp) do
        true -> {nil, exp}
        false -> {exp, acc}
      end
    end)

    Macro.to_string(test_body) |> IO.puts()

    IO.inspect(where)

  end
end
