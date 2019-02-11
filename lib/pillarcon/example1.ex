defmodule Pillarcon.Example1 do
  [name: "Balser", age: 21, friends: ["Terry", "Johnson"]]
  |> Enum.map(fn {key, value} ->
    def unquote(key)() do
      unquote(value)
    end
  end)
end
