defmodule JwMinistryApi.TerritoryControllerTest do
  use JwMinistryApi.ConnCase

  alias JwMinistryApi.Territory
  @valid_attrs %{barangay: "some content", city: "some content", province: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, territory_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    territory = Repo.insert! %Territory{}
    conn = get conn, territory_path(conn, :show, territory)
    assert json_response(conn, 200)["data"] == %{"id" => territory.id,
      "barangay" => territory.barangay,
      "city" => territory.city,
      "province" => territory.province}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, territory_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, territory_path(conn, :create), territory: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Territory, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, territory_path(conn, :create), territory: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    territory = Repo.insert! %Territory{}
    conn = put conn, territory_path(conn, :update, territory), territory: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Territory, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    territory = Repo.insert! %Territory{}
    conn = put conn, territory_path(conn, :update, territory), territory: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    territory = Repo.insert! %Territory{}
    conn = delete conn, territory_path(conn, :delete, territory)
    assert response(conn, 204)
    refute Repo.get(Territory, territory.id)
  end
end
