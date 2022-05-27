defmodule PlateState.Menu.Rule do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "rules" do
    field :name, :string
    field :value, :string
    field :type, :string

    belongs_to :item, PlateState.Menu.Item

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = rule, attrs) do
    rule
    |> cast(attrs, [:name, :value, :type])
    |> validate_required([:name])
  end
end
