defmodule JwMinistryApi.CongregationView do
  use JwMinistryApi.Web, :view

  def render("index.json", %{congregations: congregations}) do
    %{data: render_many(congregations, JwMinistryApi.CongregationView, "congregation.json")}
  end

  def render("show.json", %{congregation: congregation}) do
    %{data: render_one(congregation, JwMinistryApi.CongregationView, "congregation.json")}
  end

  def render("congregation.json", %{congregation: congregation}) do
    %{id: congregation.id,
      name: congregation.name,
      coordinator_id: congregation.coordinator_id}
  end
end
