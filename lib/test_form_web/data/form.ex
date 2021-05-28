defmodule TestFormWeb.Data.Form do
  import Ecto.Changeset
  defstruct ~w[field_one field_two field_three]a

  @types %{
    field_one: :string,
    field_two: :string,
    field_three: :string
  }

  def new() do
    %{
      field_one: "",
      field_two: "",
      field_three: ""
    }
  end

  def changeset(form, params) do
    {form, @types} |> cast(params, Map.keys(@types))
  end

  def validate_changeset(form, params) do
    changeset(form, params)
    |> validate_required([
      :field_one,
      :field_two,
      :field_three
    ])
    |> Map.put(:action, :validate)
  end
end
