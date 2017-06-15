defmodule JwMinistryApi.Repo.Migrations.CreateHouseholder do
  use Ecto.Migration

  def change do
    create table(:householders) do
      add :first_name, :string
      add :last_name, :string
      add :estimated_age, :integer
      add :lat, :float
      add :long, :float
      add :status, :string
      add :remark, :string
      add :language, :string
      add :province, :string
      add :date_visited, :date
      add :territory_id, references(:territories, on_delete: :nothing)

      timestamps()
    end
    create index(:householders, [:territory_id])

  end
end
