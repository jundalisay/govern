defmodule Govern.PermitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Govern.Permits` context.
  """

  @doc """
  Generate a permit.
  """
  def permit_fixture(attrs \\ %{}) do
    {:ok, permit} =
      attrs
      |> Enum.into(%{
        name: "some name",
        photo: "some photo",
        status: "some status",
        step: "some step"
      })
      |> Govern.Permits.create_permit()

    permit
  end
end
