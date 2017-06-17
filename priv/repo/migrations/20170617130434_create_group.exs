defmodule JwMinistryApi.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :group_overseer_id, references(:publishers, on_delete: :nothing)
      add :congregation_id, references(:congregations, on_delete: :nothing)

      timestamps()
    end
    create index(:groups, [:group_overseer_id])
    create index(:groups, [:congregation_id])

  end
end
