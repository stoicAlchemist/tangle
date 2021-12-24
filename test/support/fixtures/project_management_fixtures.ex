defmodule Tangle.ProjectManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tangle.ProjectManagement` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Tangle.ProjectManagement.create_project()

    project
  end
end
