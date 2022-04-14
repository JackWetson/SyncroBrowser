class Api::V1::TeamSerializer < Api::V1::ApplicationSerializer
  include Api::V1::Teams::SerializerBase

  # The `:id` entries are redundant, but for the moment they help us generate valid code.
  attributes :id,
    :subdomain,
    :api,
    :allowed_updates,
    # 🚅 super scaffolding will insert new fields above this line.
    :id
end
