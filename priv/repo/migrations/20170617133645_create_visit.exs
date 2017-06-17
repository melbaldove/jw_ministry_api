defmodule JwMinistryApi.Repo.Migrations.CreateVisit do
  use Ecto.Migration

  def change do
    create table(:visits) do
      add :remarks, :string
      add :comment, :string
      add :date_visited, :date
      add :householder_id, references(:householders, on_delete: :nothing)

      timestamps()
    end
    create index(:visits, [:householder_id])

  end
end
