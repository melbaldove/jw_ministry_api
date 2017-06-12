defmodule JwMinistryApi.TerritoryView do
  use JwMinistryApi.Web, :view

  def render("index.json", %{territories: territories}) do
    %{data: render_many(territories, JwMinistryApi.TerritoryView, "territory.json")}
  end

  def render("show.json", %{territory: territory}) do
    %{data: render_one(territory, JwMinistryApi.TerritoryView, "territory.json")}
  end

  def render("territory.json", %{territory: territory}) do
    %{id: territory.id,
      barangay: territory.barangay,
      city: territory.city,
      province: territory.province}
  end
end
