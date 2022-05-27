defmodule PlateStateWeb.Schema.Custom.DecimalType do
  @moduledoc """
  The Json scalar type allows arbitrary JSON values to be passed in and out.
  Requires `{ :jason, "~> 1.1" }` package: https://github.com/michalmuskala/jason
  """
  use Absinthe.Schema.Notation

  scalar :decimal do
    parse(fn
      %{value: value}, _ ->
        {decimal, _} = Decimal.parse(value)
        {:ok, decimal}

      _, _ ->
        :error
    end)

    serialize(&to_string/1)
  end
end
