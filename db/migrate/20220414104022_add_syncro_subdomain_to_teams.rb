class AddSyncroSubdomainToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :subdomain, :text
  end
end
