defmodule Pillarcon.Schema do

  defmacro __using__(_opts) do
    quote do
      import Pillarcon.Schema
      Module.register_attribute(__MODULE__, :schema_fields, accumulate: true)
    end
  end


  defmacro field(name, opts) do
    quote do
      Module.put_attribute(__MODULE__, :schema_fields, {unquote(name), unquote(opts)})
    end
  end

end
