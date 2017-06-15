defmodule JwMinistryApi.HouseholderTest do
  use JwMinistryApi.ModelCase

  alias JwMinistryApi.Householder

  @valid_attrs %{date_visited: %{day: 17, month: 4, year: 2010}, estimated_age: 42, first_name: "some content", language: "some content", last_name: "some content", lat: "120.5", long: "120.5", province: "some content", remark: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Householder.changeset(%Householder{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Householder.changeset(%Householder{}, @invalid_attrs)
    refute changeset.valid?
  end
end
