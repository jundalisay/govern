defmodule Govern.PantriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Govern.Pantries` context.
  """

  @doc """
  Generate a pantry.
  """
  def pantry_fixture(attrs \\ %{}) do
    {:ok, pantry} =
      attrs
      |> Enum.into(%{
        address: "some address",
        description: "some description",
        name: "some name",
        photo: "some photo"
      })
      |> Govern.Pantries.create_pantry()

    pantry
  end
end
