defmodule TestFormWeb.FormContainerLive do
  use TestFormWeb, :live_view

  def render(assigns) do
    ~L"""
    <%= live_component @socket, TestFormWeb.FormComponentLive, id: "form_component" %>
    """
  end
end
