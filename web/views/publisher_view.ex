defmodule JwMinistryApi.PublisherView do
  use JwMinistryApi.Web, :view

  def render("index.json", %{publishers: publishers}) do
    %{data: render_many(publishers, JwMinistryApi.PublisherView, "publisher.json")}
  end

  def render("show.json", %{publisher: publisher}) do
    %{data: render_one(publisher, JwMinistryApi.PublisherView, "publisher.json")}
  end

  def render("publisher.json", %{publisher: publisher}) do
    %{id: publisher.id,
      first_name: publisher.first_name,
      last_name: publisher.last_name,
      role_id: publisher.role_id}
  end
end
