class RenameColumn < ActiveRecord::Migration
  def up
  	rename_column :current_events, :updates, :events
  end

  def down
  end
end
