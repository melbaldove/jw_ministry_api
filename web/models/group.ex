defmodule JwMinistryApi.Group do
  use JwMinistryApi.Web, :model

  schema "groups" do
    field :name, :string
    has_many :publishers, JwMinistryApi.Publisher
    belongs_to :publisher, JwMinistryApi.Publisher
    belongs_to :congregation, JwMinistryApi.Congregation
    many_to_many :territories, JwMinistryApi.Territory, join_through: JwMinistryApi.GroupTerritory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
