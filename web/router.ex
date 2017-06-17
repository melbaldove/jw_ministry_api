defmodule JwMinistryApi.Router do
  use JwMinistryApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JwMinistryApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", JwMinistryApi do
     pipe_through :api

     resources "/territories", TerritoryController, except: [:new, :edit]
     resources "/publishers", PublisherController, except: [:new, :edit]
     resources "/congregations", CongregationController, except: [:new, :edit]
   end
end
