# frozen_string_literal: true

module Api
  module V1
    class InvitationSerializer < Api::V1::ApplicationSerializer
      include Api::V1::Invitations::SerializerBase

      # The `:id` entries are redundant, but for the moment they help us generate valid code.
      attributes :id,
                 # 🚅 super scaffolding will insert new fields above this line.
                 :id
    end
  end
end
