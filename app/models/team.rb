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
class Team < ApplicationRecord
  include Teams::Base
  include Webhooks::Outgoing::TeamSupport

  # 🚅 add concerns above.

  # 🚅 add belongs_to associations above.

  has_many :customers, dependent: :destroy, enable_updates: true
  # 🚅 add has_many associations above.

  # 🚅 add oauth providers above.

  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
end
