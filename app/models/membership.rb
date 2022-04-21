# == Schema Information
#
# Table name: memberships
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  team_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  invitation_id         :bigint
#  user_first_name       :string
#  user_last_name        :string
#  user_profile_photo_id :string
#  user_email            :string
#  added_by_id           :bigint
#  platform_agent_of_id  :bigint
#  role_ids              :jsonb
#
class Membership < ApplicationRecord
  include Memberships::Base
  # 🚅 add concerns above.

  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  # 🚅 add oauth providers above.

  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
end
