defmodule PlateState.Menu.Item do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :added_on, :date
    field :description, :string
    field :name, :string
    field :price, :decimal

    belongs_to :category, PlateState.Menu.Category

    many_to_many :tags, PlateState.Menu.ItemTag, join_through: "items_taggings"

    has_many :rules, PlateState.Menu.Rule

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price, :added_on])
    |> validate_required([:name, :price])
    |> foreign_key_constraint(:category)
  end
end
