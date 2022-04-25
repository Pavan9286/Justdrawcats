defmodule Justdrawcats.PlaylistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Justdrawcats.Playlists` context.
  """

  @doc """
  Generate a playlist.
  """
  def playlist_fixture(attrs \\ %{}) do
    {:ok, playlist} =
      attrs
      |> Enum.into(%{
        title: "some title",
        url: "some url"
      })
      |> Justdrawcats.Playlists.create_playlist()

    playlist
  end
end
