defmodule Govern.NewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Govern.News` context.
  """

  @doc """
  Generate a article.
  """
  def article_fixture(attrs \\ %{}) do
    {:ok, article} =
      attrs
      |> Enum.into(%{
        category: "some category",
        content: "some content",
        intro: "some intro",
        name: "some name",
        photto: "some photto",
        subname: "some subname"
      })
      |> Govern.News.create_article()

    article
  end
end
