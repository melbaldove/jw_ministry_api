defmodule JwMinistryApi.Repo.Migrations.CreateGroupTerritory do
  use Ecto.Migration

  def change do
    create table(:group_territories) do
      add :group_id, references(:groups, on_delete: :nothing)
      add :territory_id, references(:territories, on_delete: :nothing)

      timestamps()
    end
    create index(:group_territories, [:group_id])
    create index(:group_territories, [:territory_id])

  end
end
