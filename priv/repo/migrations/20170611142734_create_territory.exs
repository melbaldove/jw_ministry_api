defmodule JwMinistryApi.Repo.Migrations.CreateTerritory do
  use Ecto.Migration

  def change do
    create table(:territories) do
      add :barangay, :string
      add :city, :string
      add :province, :string

      timestamps()
    end

  end
end
