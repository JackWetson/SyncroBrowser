# frozen_string_literal: true

class DropScaffoldingThings < ActiveRecord::Migration[6.0]
  def up
    drop_table :scaffolding_things
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
