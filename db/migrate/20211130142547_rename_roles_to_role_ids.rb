# frozen_string_literal: true

class RenameRolesToRoleIds < ActiveRecord::Migration[6.1]
  def change
    rename_column :scaffolding_absolutely_abstract_creative_concepts_collaborators, :roles, :role_ids
    Scaffolding::AbsolutelyAbstract::CreativeConcepts::Collaborator.update_all role_ids: []
  end
end
