defmodule JwMinistryApi.Group do
  use JwMinistryApi.Web, :model

  schema "groups" do
    field :name, :string
    belongs_to :group_overseer, JwMinistryApi.GroupOverseer
    belongs_to :congregation, JwMinistryApi.Congregation

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
