# == Schema Information
#
# Table name: invitations
#
#  id                 :integer          not null, primary key
#  email              :string
#  uuid               :string
#  from_membership_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  team_id            :integer
#
FactoryBot.define do
  factory :invitation do
    uuid { "1111" }
    association :team
    association :from_membership, factory: :membership
    sequence(:email) { |n| "example#{n}@email.com" }
  end
end
