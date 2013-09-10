class RenameCompanyUpdatesToCurrentEvents < ActiveRecord::Migration
  def up
  	rename_table :company_updates, :current_events
  end

  def down
  	rename_table :current_events, :company_updates
  end
end
