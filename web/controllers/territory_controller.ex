defmodule JwMinistryApi.TerritoryController do
  use JwMinistryApi.Web, :controller

  alias JwMinistryApi.Territory

  def index(conn, _params) do
    territories = Repo.all(Territory)
    render(conn, "index.json", territories: territories)
  end

  def create(conn, %{"territory" => territory_params}) do
    changeset = Territory.changeset(%Territory{}, territory_params)

    case Repo.insert(changeset) do
      {:ok, territory} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", territory_path(conn, :show, territory))
        |> render("show.json", territory: territory)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JwMinistryApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    territory = Repo.get!(Territory, id)
    render(conn, "show.json", territory: territory)
  end

  def update(conn, %{"id" => id, "territory" => territory_params}) do
    territory = Repo.get!(Territory, id)
    changeset = Territory.changeset(territory, territory_params)

    case Repo.update(changeset) do
      {:ok, territory} ->
        render(conn, "show.json", territory: territory)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JwMinistryApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    territory = Repo.get!(Territory, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(territory)

    send_resp(conn, :no_content, "")
  end
end
