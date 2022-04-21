# frozen_string_literal: true

module Api
  module V1
    class TeamsEndpoint < Api::V1::Root
      PARAMS = proc do
        optional :subdomain, type: String, desc: Api.heading(:subdomain)
        optional :api, type: String, desc: Api.heading(:api)
        optional :allowed_updates, type: String, desc: Api.heading(:allowed_updates)
        # 🚅 super scaffolding will insert new fields above this line.
        # 🚅 super scaffolding will insert new arrays above this line.
        # 🚅 super scaffolding will insert processing for new fields above this line.
      end

      include Api::V1::Teams::EndpointBase
    end
  end
end
