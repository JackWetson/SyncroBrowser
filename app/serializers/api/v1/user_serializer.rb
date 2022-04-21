# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < Api::V1::ApplicationSerializer
      include Api::V1::Users::SerializerBase

      # The `:id` entries are redundant, but for the moment they help us generate valid code.
      attributes :id,
                 # 🚅 super scaffolding will insert new fields above this line.
                 :id
    end
  end
end
