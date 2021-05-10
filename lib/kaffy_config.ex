defmodule TestAdmin.KaffyConfig do
  def create_resources(_conn) do
    [
      user: [
        name: "User", # a custom name for this context/section.
        resources: [
          # this line used to be "schemas" in pre v0.9
          user: [
            schema: TestAdmin.Users.User,
            admin: TestAdmin.Users.UserAdmin
          ],
          profile: [
            schema: TestAdmin.Users.Profile,
            admin: TestAdmin.Users.ProfileAdmin
          ],
        ]
      ]
    ]
  end
end