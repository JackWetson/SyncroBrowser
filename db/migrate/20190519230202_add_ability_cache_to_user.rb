# frozen_string_literal: true

class AddAbilityCacheToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ability_cache, :jsonb
  end
end
