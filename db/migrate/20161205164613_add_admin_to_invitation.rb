# frozen_string_literal: true

class AddAdminToInvitation < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :admin, :boolean
  end
end
