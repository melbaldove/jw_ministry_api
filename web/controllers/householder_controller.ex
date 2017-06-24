defmodule JwMinsitryApi.HouseholderController do
  use JwMinistryApi.Web, :controller
  
  alias JwMinistryApi.Householder
  alias JwMinistryApi.Territory

  def index(conn, _params) do
    householders = Repo.all(Householder)
    render(conn, "index.json", householders: householders)
  end

  def create(conn, %{"householder" => %{"territory" => territory_params 
                                                    = householder_params}) do
    changeset = Householder.changeset(%Householder{}, householder_params)
    
    with {:ok, territory} -> create_territory(territory_params)
    
    
  end

  
  def search_territory(territory_params) do
      
  end

  def create_territory(territory_params) do
    changeset = Territory.changeset(%Territory{}, territory_params)

    Repo.insert(changeset)
  end
end