defmodule JwMinistryApi.Repo.Migrations.AddPublisherGroupId do
  use Ecto.Migration

  def change do
    alter table(:publishers) do
      add :group_id, references(:groups, on_delete: :nothing)
    end

    create index(:publishers, [:group_id])
  end
end
