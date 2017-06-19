defmodule JwMinistryApi.GroupTerritoryTest do
  use JwMinistryApi.ModelCase

  alias JwMinistryApi.GroupTerritory

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GroupTerritory.changeset(%GroupTerritory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GroupTerritory.changeset(%GroupTerritory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
