defmodule Pillarcon.Person do
  use Pillarcon.Schema

  field :name, required: true
  field :age, default: 21
  field :subscribed, default: true

end
