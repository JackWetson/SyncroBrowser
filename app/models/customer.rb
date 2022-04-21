# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  team_id                :bigint           not null
#  syncroid               :integer
#  firstname              :string
#  lastname               :string
#  businessname           :string
#  email                  :string
#  phone                  :string
#  mobile                 :string
#  created                :datetime
#  updated                :datetime
#  pdf_url                :string
#  address                :string
#  address_2              :string
#  city                   :string
#  state                  :string
#  zip                    :string
#  latitude               :float
#  longitude              :float
#  notes                  :string
#  get_sms                :boolean
#  opt_out                :boolean
#  disabled               :boolean
#  no_email               :boolean
#  business_and_full_name :string
#  business_then_name     :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Customer < ApplicationRecord
  # 🚅 add concerns above.

  belongs_to :team
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :syncroid, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
end
