defmodule Pillarcon.Schema do
  defmacro __using__(_opts) do
    quote do
      import Pillarcon.Schema
      @before_compile Pillarcon.Schema
      Module.register_attribute(__MODULE__, :schema_fields, accumulate: true)
    end
  end

  defmacro __before_compile__(env) do
    schema_fields = Module.get_attribute(env.module, :schema_fields)

    struct_fields =
      Enum.map(schema_fields, fn {name, opts} ->
        {name, Keyword.get(opts, :default, nil)}
      end)

    quote do
      defstruct(unquote(struct_fields))
    end
  end

  defmacro field(name, opts) do
    quote do
      Module.put_attribute(__MODULE__, :schema_fields, {unquote(name), unquote(opts)})
    end
  end
end
