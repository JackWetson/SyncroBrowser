# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string           default(""), not null
#  encrypted_password              :string           default(""), not null
#  reset_password_token            :string
#  reset_password_sent_at          :datetime
#  remember_created_at             :datetime
#  sign_in_count                   :integer          default(0), not null
#  current_sign_in_at              :datetime
#  last_sign_in_at                 :datetime
#  current_sign_in_ip              :inet
#  last_sign_in_ip                 :inet
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  current_team_id                 :integer
#  first_name                      :string
#  last_name                       :string
#  time_zone                       :string
#  last_seen_at                    :datetime
#  profile_photo_id                :string
#  ability_cache                   :jsonb
#  last_notification_email_sent_at :datetime
#  former_user                     :boolean          default(FALSE), not null
#  encrypted_otp_secret            :string
#  encrypted_otp_secret_iv         :string
#  encrypted_otp_secret_salt       :string
#  consumed_timestep               :integer
#  otp_required_for_login          :boolean
#  otp_backup_codes                :string           is an Array
#  locale                          :string
#  platform_agent_of_id            :bigint
#
class User < ApplicationRecord
  include Users::Base
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
