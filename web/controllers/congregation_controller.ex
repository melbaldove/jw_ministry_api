defmodule JwMinistryApi.CongregationController do
  use JwMinistryApi.Web, :controller

  alias JwMinistryApi.Congregation

  def index(conn, _params) do
    congregations = Repo.all(Congregation)
    render(conn, "index.json", congregations: congregations)
  end

  def create(conn, %{"congregation" => congregation_params}) do
    changeset = Congregation.changeset(%Congregation{}, congregation_params)

    case Repo.insert(changeset) do
      {:ok, congregation} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", congregation_path(conn, :show, congregation))
        |> render("show.json", congregation: congregation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JwMinistryApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    congregation = Repo.get!(Congregation, id)
    render(conn, "show.json", congregation: congregation)
  end

  def update(conn, %{"id" => id, "congregation" => congregation_params}) do
    congregation = Repo.get!(Congregation, id)
    changeset = Congregation.changeset(congregation, congregation_params)

    case Repo.update(changeset) do
      {:ok, congregation} ->
        render(conn, "show.json", congregation: congregation)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(JwMinistryApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    congregation = Repo.get!(Congregation, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(congregation)

    send_resp(conn, :no_content, "")
  end
end
