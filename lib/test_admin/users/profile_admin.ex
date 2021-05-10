defmodule TestAdmin.Users.ProfileAdmin do
  def authorized?(_schema, conn) do
    true
  end

  def widgets(_schema, _conn) do
    [
      %{
        type: "tidbit",
        title: "Average Reviews",
        content: "1.9 / 5.0",
        icon: "thumbs-up",
        order: 1,
        width: 6,
      }
    ]
  end
end