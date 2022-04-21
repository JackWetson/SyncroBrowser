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
FactoryBot.define do
  factory :customer do
    association :team
    syncroid { 1 }
    firstname { 'MyString' }
    lastname { 'MyString' }
    businessname { 'MyString' }
    email { 'MyString' }
    phone { 'MyString' }
    mobile { 'MyString' }
    created { '2022-04-20 14:13:05' }
    updated { '2022-04-20 14:13:05' }
    pdf_url { 'MyString' }
    address { 'MyString' }
    address_2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    zip { 'MyString' }
    latitude { 1.5 }
    longitude { 1.5 }
    notes { 'MyString' }
    get_sms { false }
    opt_out { false }
    disabled { false }
    no_email { false }
    business_and_full_name { 'MyString' }
    business_then_name { 'MyString' }
  end
end
