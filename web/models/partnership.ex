defmodule JwMinistryApi.Partnership do
  use JwMinistryApi.Web, :model

  schema "partnerships" do
    belongs_to :publisher, JwMinistryApi.Publisher
    belongs_to :visit, JwMinistryApi.Visit

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:publisher, :visit])
    |> validate_required([:publisher, :visit])
  end
end