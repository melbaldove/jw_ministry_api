defmodule JwMinistryApi.GroupTerritory do
  use JwMinistryApi.Web, :model

  schema "group_territories" do
    belongs_to :group, JwMinistryApi.Group
    belongs_to :territory, JwMinistryApi.Territory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
