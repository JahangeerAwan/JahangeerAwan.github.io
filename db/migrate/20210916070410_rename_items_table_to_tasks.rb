class RenameItemsTableToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_table :items, :tasks
  end
end
