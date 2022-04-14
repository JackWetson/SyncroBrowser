class AddSyncroApiToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :api, :text
  end
end
