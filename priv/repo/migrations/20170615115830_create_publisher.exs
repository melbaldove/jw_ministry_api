defmodule JwMinistryApi.Repo.Migrations.CreatePublisher do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :first_name, :string
      add :last_name, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end
    create index(:publishers, [:role_id])

  end
end
