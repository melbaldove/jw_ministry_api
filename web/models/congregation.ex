defmodule JwMinistryApi.Congregation do
  use JwMinistryApi.Web, :model

  schema "congregations" do
    field :name, :string
    belongs_to :coordinator, JwMinistryApi.Coordinator

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
