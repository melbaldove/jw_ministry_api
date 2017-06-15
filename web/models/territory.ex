defmodule JwMinistryApi.Territory do
  use JwMinistryApi.Web, :model

  schema "territories" do
    field :barangay, :string
    field :city, :string
    field :province, :string
    has_many :householder, JwMinistryApi.Householder

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:barangay, :city, :province])
    |> validate_required([:barangay, :city, :province])
  end
end
