# frozen_string_literal: true

class AddCsvImportToScaffoldingThings < ActiveRecord::Migration[5.2]
  def change
    add_reference :scaffolding_things, :csv_import, foreign_key: { to_table: :imports_csv_imports }
  end
end
