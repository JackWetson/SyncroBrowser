# frozen_string_literal: true

class CreateOauthAccessGrants < ActiveRecord::Migration[6.1]
  def change
    create_table :oauth_access_grants, &:timestamps
  end
end
