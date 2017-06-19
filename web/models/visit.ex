defmodule JwMinistryApi.Visit do
  use JwMinistryApi.Web, :model

  schema "visits" do
    field :remarks, :string
    field :comment, :string
    field :date_visited, Ecto.Date
    belongs_to :householder, JwMinistryApi.Householder
    many_to_many :publishers, JwMinistryApi.Publisher, join_through: JwMinistryApi.Partnership

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:remarks, :comment, :date_visited])
    |> validate_required([:remarks, :comment, :date_visited])
  end
end
