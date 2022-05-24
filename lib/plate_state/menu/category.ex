defmodule PlateState.Menu.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string
    field :name, :string

    has_many :items, PlateState.Menu.Item

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = category, attrs) do
    category
    |> cast(attrs, [:description, :name])
    |> validate_required([:name])
  end
end
