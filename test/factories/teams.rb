# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id                :integer          not null, primary key
#  name              :string
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  being_destroyed   :boolean
#  time_zone         :string
#  locale            :string
#  subdomain         :text
#  api               :text
#  allowed_updates   :boolean
#  syncro_account_id :integer
#
FactoryBot.define do
  factory :team do
    sequence(:name) { |n| "Generic Team #{n}" }
    sequence(:slug) { |n| "team_#{n}" }
    time_zone { nil }
    locale { nil }
  end
end
