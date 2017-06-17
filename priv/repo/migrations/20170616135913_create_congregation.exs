defmodule JwMinistryApi.Repo.Migrations.CreateCongregation do
  use Ecto.Migration

  def change do
    create table(:congregations) do
      add :name, :string
      add :coordinator_id, references(:publishers, on_delete: :nothing)

      timestamps()
    end
    create index(:congregations, [:coordinator_id])

  end
end
