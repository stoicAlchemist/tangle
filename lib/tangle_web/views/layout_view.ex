defmodule TangleWeb.LayoutView do
  use TangleWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def current_menu_class?(
    %Plug.Conn{private: %{phoenix_controller: current_controller}},
    testing
  ) do

    if (current_controller |> Atom.to_string() |> String.contains?(testing)) do
      "active" 
    else
      ""
    end
  end

  def current_menu_class?(_conn, _test), do: ""

  def menu_items(%Plug.Conn{} = conn) do
    if conn.assigns.current_user do
      [
        %{
          text: "Projects",
          class: current_menu_class?(conn, "Project"),
          route: Routes.project_path(conn, :index)
        },
        %{
          text: "Users",
          class: current_menu_class?(conn, "User"),
          route: Routes.user_path(conn, :index)
        },
        %{ text: "Test", class: "Nothing", route: "#" }
      ]
    else
      []
    end
  end

end
