defmodule PlateState.Menu.ItemTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item_tags" do
    field :description
    field :name, :string

    many_to_many :items, PlateState.Menu.Item, join_through: "items_taggings"

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = item_tag, attrs) do
    item_tag
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
  end
end
