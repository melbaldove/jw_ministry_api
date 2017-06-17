defmodule JwMinistryApi.VisitTest do
  use JwMinistryApi.ModelCase

  alias JwMinistryApi.Visit

  @valid_attrs %{comment: "some content", date_visited: %{day: 17, month: 4, year: 2010}, remarks: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Visit.changeset(%Visit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Visit.changeset(%Visit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
