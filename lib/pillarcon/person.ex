defmodule Pillarcon.Person do
  use Pillarcon.Schema

  field :name, required: true
  field :age, default: 21
  field :subscribed, default: true

  if System.get_env("TEST") == "1" do
    IO.puts("Green")
  else
    IO.puts("Red")
  end


end
