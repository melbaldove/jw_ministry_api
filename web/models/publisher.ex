defmodule JwMinistryApi.Publisher do
  use JwMinistryApi.Web, :model

  schema "publishers" do
    field :first_name, :string
    field :last_name, :string
    belongs_to :role, JwMinistryApi.Role
    belongs_to :group, JwMinistryApi.Group
    has_one :congregation, JwMinistryApi.Congregation
    has_one :group, JwMinistryApi.Group
    many_to_many :visits, JwMinistryApi.Visit, join_through: JwMinistryApi.Partnership

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name])
    |> validate_required([:first_name, :last_name])
  end
end
