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

    {:where, _, [[variables | data]]} = where

    Enum.map(data, &Enum.zip(variables, &1))
    |> Enum.map(fn binding ->

      Enum.map(binding, fn {name, value} ->
        {:=, [], [{name, [], __MODULE__}, value]}
      end)

    end)
    |> Enum.map(fn variables ->
      {:__block__, context, args} = test_body
      {:__block__, context, variables ++ args}
    end)
    |> Enum.each(fn block -> Code.eval_quoted(block, [], __ENV__) end)


  end
end
