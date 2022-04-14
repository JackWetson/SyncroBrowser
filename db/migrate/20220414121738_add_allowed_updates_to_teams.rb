class AddAllowedUpdatesToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :allowed_updates, :boolean
  end
end
