defmodule JwMinistryApi.Householder do
  use JwMinistryApi.Web, :model

  schema "householders" do
    field :first_name, :string
    field :last_name, :string
    field :estimated_age, :integer
    field :lat, :float
    field :long, :float
    field :status, :string
    field :remark, :string
    field :language, :string
    field :province, :string
    field :date_visited, Ecto.Date
    belongs_to :territory, JwMinistryApi.Territory

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :estimated_age, :lat, :long, :status, :remark, :language, :province, :date_visited])
    |> validate_required([:first_name, :last_name, :estimated_age, :lat, :long, :status, :remark, :language, :province, :date_visited])
  end
end
