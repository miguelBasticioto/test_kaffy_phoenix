defmodule TestAdmin.Repo.Migrations.Profile do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
