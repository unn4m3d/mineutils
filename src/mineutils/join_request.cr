require "json"

module MineUtils
  class JoinRequest
    JSON.mapping(
      {
        accessToken: String,
        selectedProfile: String,
        serverId: String
      }
    )
  end
end
