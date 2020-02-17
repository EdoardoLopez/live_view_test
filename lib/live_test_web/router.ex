defmodule LiveTestWeb.Router do
  use LiveTestWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveTestWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/home_controller", PageController, :home
    live "/home_live", HomeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveTestWeb do
  #   pipe_through :api
  # end
end
