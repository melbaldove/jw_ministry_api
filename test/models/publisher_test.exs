defmodule JwMinistryApi.PublisherTest do
  use JwMinistryApi.ModelCase

  alias JwMinistryApi.Publisher

  @valid_attrs %{first_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Publisher.changeset(%Publisher{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Publisher.changeset(%Publisher{}, @invalid_attrs)
    refute changeset.valid?
  end
end
