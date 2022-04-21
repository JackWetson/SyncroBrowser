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
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "generic-user-#{n}@example.com" }
    password { "08h4f78hrc0ohw9f8heso" }
    password_confirmation { "08h4f78hrc0ohw9f8heso" }
    sign_in_count { 1 }
    current_sign_in_at { Time.now }
    last_sign_in_at { 1.day.ago }
    current_sign_in_ip { "127.0.0.1" }
    last_sign_in_ip { "127.0.0.2" }
    time_zone { nil }
    locale { nil }
    factory :onboarded_user do
      first_name { "First Name" }
      last_name { "Last Name" }
      after(:create) do |user|
        user.create_default_team
      end
      factory :two_factor_user do
        otp_secret { User.generate_otp_secret }
        otp_required_for_login { true }
      end
    end
  end
end
