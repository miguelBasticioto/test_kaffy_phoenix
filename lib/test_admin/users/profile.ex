defmodule TestAdmin.Users.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :name, :string

    belongs_to :user, TestAdmin.Users.User

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name])
  end
end
