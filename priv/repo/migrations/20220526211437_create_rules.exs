defmodule PlateSlate.Repo.Migrations.CreateRules do
  use Ecto.Migration

  def change do
    create table(:rules) do
      add :item_id, references(:items), null: false
      add :name, :string
      add :value, :string
      add :type, :string

      timestamps()
    end
  end
end
