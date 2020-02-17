defmodule LiveTestWeb.HomeLive do
use Phoenix.LiveView
alias LiveTestWeb.Router.Helpers, as: Routes
  def mount(params, session, socket) do
    IO.inspect params
    {:ok, socket}
  end

  def render(assigns) do
    LiveTestWeb.PageView.render("home.html", assigns)
  end

  def handle_event("redirect", _params, socket) do
    {
      :stop,
      socket
      |> put_flash(:info, "Info Message")
      |> put_flash(:error, "Error Message")
      |> redirect(to: Routes.page_path(socket, :index))
    }
  end
end
