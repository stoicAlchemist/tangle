defmodule Tangle.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string, null: false
      add :description, :string, null: false # It's a documentation tool, document your description!!

      timestamps()
    end
  end
end
