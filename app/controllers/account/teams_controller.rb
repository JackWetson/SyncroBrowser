# frozen_string_literal: true

module Account
  class TeamsController < Account::ApplicationController
    include Account::Teams::ControllerBase

    private

    def permitted_fields
      [
        :description,
        :subdomain,
        :api,
        :allowed_updates
        # 🚅 super scaffolding will insert new fields above this line.
      ]
    end

    def permitted_arrays
      {
        # 🚅 super scaffolding will insert new arrays above this line.
      }
    end

    def process_params(strong_params)
      # 🚅 super scaffolding will insert processing for new fields above this line.
      strong_params
    end
  end
end
