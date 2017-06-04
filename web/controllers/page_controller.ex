defmodule JwMinistryApi.PageController do
  use JwMinistryApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
