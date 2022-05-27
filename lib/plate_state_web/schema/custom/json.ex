defmodule PlateStateWeb.Schema.Custom.JSON do
  @moduledoc """
  The Json scalar type allows arbitrary JSON values to be passed in and out.
  Requires `{ :jason, "~> 1.1" }` package: https://github.com/michalmuskala/jason
  """
  use Absinthe.Schema.Notation
  alias Absinthe.Blueprint.Input

  scalar :json, name: "Json" do
    description("""
    The `Json` scalar type represents arbitrary json string data, represented as UTF-8
    character sequences. The Json type is most often used to represent a free-form
    human-readable json string.
    """)

    serialize(&encode/1)
    parse(&decode/1)
  end

  @spec decode(Input.String.t()) :: {:ok, term()} | :error
  @spec decode(Input.Null.t()) :: {:ok, nil}
  defp decode(%Input.String{value: value}) do
    case Jason.decode(value) do
      {:ok, result} -> {:ok, result}
      _ -> :error
    end
  end

  defp decode(%Input.Null{}) do
    {:ok, nil}
  end

  defp decode(_) do
    :error
  end

  defp encode(value), do: value
end
