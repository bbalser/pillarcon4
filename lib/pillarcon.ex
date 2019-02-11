defmodule Pillarcon do
  @moduledoc """
  Documentation for Pillarcon.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Pillarcon.hello()
      :world

  """
  def hello do
    :world
  end

  defmacro stuff(do: do_block) do
    IO.inspect(do_block )
  end

end
