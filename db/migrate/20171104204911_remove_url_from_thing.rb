# frozen_string_literal: true

class RemoveUrlFromThing < ActiveRecord::Migration[5.1]
  def change
    remove_column :things, :url, :string
  end
end
