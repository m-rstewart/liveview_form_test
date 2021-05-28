defmodule TestFormWeb.FormComponentLive do
  use TestFormWeb, :live_component
  use Phoenix.HTML
  alias TestFormWeb.Data.Form

  def update(_assigns, socket) do
    {:ok, reset_form(socket)}
  end

  def handle_event("validate", %{"test_form" => params}, socket) do
    changeset =
      Form.new()
      |> Form.validate_changeset(params)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("submit", %{"test_form" => params}, socket) do
    changeset = Form.new() |> Form.validate_changeset(params)

    if changeset.valid? do
      IO.puts("Successful Post")
      IO.inspect(changeset)
      {:noreply, socket}
    else
      {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("reset_form", _, socket) do
    {:noreply, reset_form(socket)}
  end

  defp reset_form(socket) do
    changeset = Form.new() |> Form.changeset(%{})

    assign(socket, changeset: changeset)
  end
end
