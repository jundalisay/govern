defmodule Govern.FeedFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Govern.Feed` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        name: "some name",
        photo: "some photo"
      })
      |> Govern.Feed.create_post()

    post
  end
end
