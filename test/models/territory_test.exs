defmodule JwMinistryApi.TerritoryTest do
  use JwMinistryApi.ModelCase

  alias JwMinistryApi.Territory

  @valid_attrs %{barangay: "some content", city: "some content", province: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Territory.changeset(%Territory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Territory.changeset(%Territory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
