defmodule LiveTestWeb.PageController do
  use LiveTestWeb, :controller
  alias Phoenix.LiveView

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def home(conn, _params) do
    LiveView.Controller.live_render(conn, LiveTestWeb.HomeLive, session: %{"from" => "controller"})
  end
end
