defmodule Pillarcon.Placebo do
  defmacro allow({{:., _, [module, function]}, _, args}) do
    IO.puts("Module: #{inspect(module)}  - Function: #{inspect(function)} - Args: #{inspect(args)}")
  end
end
