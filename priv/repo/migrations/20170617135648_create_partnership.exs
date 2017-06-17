defmodule JwMinistryApi.Repo.Migrations.CreatePartnership do
  use Ecto.Migration

  def change do
    create table(:partnerships) do
      add :visit_id, references(:visits)
      add :publisher_id, references(:publishers)

      timestamps()
    end
    create index(:partnerships, [:visit_id])
    create index(:partnerships, [:publisher_id])


  end
end
