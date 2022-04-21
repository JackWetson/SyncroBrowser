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
class Invitation < ApplicationRecord
  include Invitations::Base
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
