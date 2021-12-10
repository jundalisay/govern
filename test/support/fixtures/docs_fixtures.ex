defmodule Govern.DocsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Govern.Docs` context.
  """

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        description: "some description",
        link: "some link",
        name: "some name",
        views: 42
      })
      |> Govern.Docs.create_document()

    document
  end
end
