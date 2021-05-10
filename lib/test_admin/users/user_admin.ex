defmodule TestAdmin.Users.UserAdmin do
  def authorized?(_schema, conn) do
    true
  end

  def widgets(_schema, _conn) do
    [
      %{
        type: "tidbit",
        title: "Average Reviews",
        content: "4.7 / 5.0",
        icon: "thumbs-up",
        order: 1,
        width: 6,
      },
      %{
        type: "progress",
        title: "Pancakes",
        content: "Customer Satisfaction",
        percentage: 79,
        order: 3,
        width: 6,
      },
      %{
        type: "chart",
        title: "This week's sales",
        order: 8,
        width: 12,
        content: %{
          x: ["Mon", "Tue", "Wed", "Thu", "Today"],
          y: [150, 230, 75, 240, 290],
          y_title: "USD"
        }
      }
    ]
  end
end