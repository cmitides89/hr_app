class RenameUpdatesToCompanyUpdates < ActiveRecord::Migration
  def up
  	rename_table :updates, :company_updates
  end

  def down
  	rename_table :company_updates, :updates
  end
end
