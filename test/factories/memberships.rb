# frozen_string_literal: true

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
FactoryBot.define do
  factory :membership do
    association :user
    association :team
  end
end
