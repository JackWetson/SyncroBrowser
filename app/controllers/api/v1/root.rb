# frozen_string_literal: true

module Api
  module V1
    class Root < Api::Base
      include Api::V1::Base

      mount Api::V1::CustomersEndpoint
      # 🚅 super scaffolding will mount new endpoints above this line.

      handle_not_found
    end
  end
end
