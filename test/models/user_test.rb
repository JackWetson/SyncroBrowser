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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'jane@bullettrain.co')
  end

  test 'details_provided should be true when details are provided' do
    @user = FactoryBot.create :onboarded_user, first_name: 'a', last_name: 'b'
    assert @user.details_provided?
  end

  test "details_provided should be false when details aren't provided" do
    @user = FactoryBot.create :user, first_name: 'a', last_name: nil
    assert_equal @user.details_provided?, false
  end
end
