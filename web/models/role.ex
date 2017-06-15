defmodule JwMinistryApi.Role do
  use JwMinistryApi.Web, :model

  schema "roles" do
    field :name, :string
    has_many :publisher, JwMinistryApi.Publisher

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
